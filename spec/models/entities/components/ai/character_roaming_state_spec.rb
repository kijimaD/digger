# frozen_string_literal: true

RSpec.describe CharacterRoamingState do
  let(:object_pool) { ObjectPool.new }
  let(:player_input) { PlayerInput.new(object_pool) }
  let(:ai_input) { AiInput.new(object_pool) }
  let(:ai_character) { Character.new(object_pool, ai_input, 1, 1) }

  before { World.new(object_pool, 'test_map.txt') }

  describe '#roaming' do
    it 'if can not move, turn right' do
      ai_character.physics.direction = 0
      expect { ai_character.input.motion.update }.to change{ ai_character.physics.direction }.from(0).to(90)
    end
  end
end
