# frozen_string_literal: true

RSpec.describe CharacterMotionState do
  let(:object_pool) { ObjectPool.new }
  let(:character) { Character.new(object_pool, AiInput.new(object_pool), 1, 1) }

  before { World.new(object_pool, 'test_map.txt') }

  describe '#should_change_direction?' do
    context 'when there is a wall in front' do
      it 'return true' do
        character.physics.direction = 0 # up
        character.input.motion.current_state.should_change_direction?
      end
    end

    context 'when there is no obstacles' do
      it 'return false' do
        character.physics.direction = 180 # down
        character.input.motion.current_state.should_change_direction?
      end
    end
  end
end
