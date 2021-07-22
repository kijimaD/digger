# frozen_string_literal: true

RSpec.describe CharacterChasingState do
  let(:object_pool) { ObjectPool.new }
  let(:player_input) { PlayerInput.new(object_pool) }
  let(:ai_input) { AiInput.new(object_pool) }
  let(:ai_character) { Character.new(object_pool, ai_input, 1, 1) }

  before { World.new(object_pool, 'test_map.txt') }

  describe '#chase' do
    it 'turn in the direction of player' do
      Character.new(object_pool, player_input, 2, 2)
      ai_character.physics.direction = 0 # up

      expect { ai_character.input.motion.update }.to change { ai_character.physics.direction }.from(0).to(90)
    end
  end
end
