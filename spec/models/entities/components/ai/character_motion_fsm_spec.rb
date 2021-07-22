# frozen_string_literal: true

RSpec.describe CharacterMotionFSM do
  let(:object_pool) { ObjectPool.new }
  let(:player_input) { PlayerInput.new(object_pool) }
  let(:ai_input) { AiInput.new(object_pool) }
  let(:ai_character) { Character.new(object_pool, ai_input, 1, 1) }

  describe '#choose_state' do
    it 'switch to roaming state' do
      ai_character.input.motion.choose_state
      expect(ai_character.input.motion.current_state.is_a?(CharacterRoamingState)).to be(true)
    end

    it 'switch to chasing state' do
      Character.new(object_pool, player_input, 2, 2)
      ai_character.input.motion.choose_state
      expect(ai_character.input.motion.current_state.is_a?(CharacterChasingState)).to be(true)
    end

    it 'not switch to chasing state' do
      Character.new(object_pool, ai_input, 2, 2)
      ai_character.input.motion.choose_state
      expect(ai_character.input.motion.current_state.is_a?(CharacterRoamingState)).to be(true)
    end
  end
end
