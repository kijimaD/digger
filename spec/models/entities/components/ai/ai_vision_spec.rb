# frozen_string_literal: true

RSpec.describe AiVision do
  let(:object_pool) { ObjectPool.new }
  let(:player_input) { PlayerInput.new(object_pool) }
  let(:ai_input) { AiInput.new(object_pool) }

  before { World.new(object_pool, 'test_map.txt') }

  describe '#initialize' do
    it 'can run' do
      expect { described_class.new(GameObject.new(object_pool, 1, 1), object_pool, 4) }.not_to raise_error
    end
  end

  describe '#closest_player' do
    it 'choose most close player' do
      _player_far = Character.new(object_pool, player_input, 5, 5)
      player_close = Character.new(object_pool, player_input, 2, 2)

      ai_vision = described_class.new(GameObject.new(object_pool, 1, 1), object_pool, 4)

      expect(ai_vision.closest_player).to eq(player_close)
    end

    it 'exclude AI character' do
      Character.new(object_pool, ai_input, 2, 2)

      ai_vision = described_class.new(GameObject.new(object_pool, 1, 1), object_pool, 4)

      expect(ai_vision.closest_player).to eq(nil)
    end
  end

  describe '#can_go_forward?' do
    context 'when cannot move' do
      it 'return true' do
        character = Character.new(object_pool, ai_input, 1, 1)
        character.physics.direction = 0
        character.physics.turn_right

        expect(character.input.vision.can_go_forward?).to be(true)
      end
    end

    context 'when can move' do
      it 'return false' do
        character = Character.new(object_pool, ai_input, 1, 1)
        character.physics.direction = 0
        character.physics.turn_left

        expect(character.input.vision.can_go_forward?).to be(false)
      end
    end
  end
end
