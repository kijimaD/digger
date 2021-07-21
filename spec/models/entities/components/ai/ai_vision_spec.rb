# frozen_string_literal: true

RSpec.describe AiVision do
  let(:object_pool) { ObjectPool.new }
  let(:player_input) { PlayerInput.new(object_pool) }
  let(:ai_input) { AiInput.new(object_pool) }

  describe '#initialize' do
    it 'can run' do
      expect { described_class.new(GameObject.new(object_pool, 1, 1), object_pool, 4) }.not_to raise_error
    end
  end

  describe '#closest_player' do
    it 'choose most close player' do
      ai_vision = described_class.new(GameObject.new(object_pool, 1, 1), object_pool, 4)

      _player_far = Character.new(object_pool, player_input, 5, 5)
      player_close = Character.new(object_pool, player_input, 2, 2)

      expect(ai_vision.closest_player).to eq(player_close)
    end

    it 'exclude AI character' do
      ai_vision = described_class.new(GameObject.new(object_pool, 1, 1), object_pool, 4)

      Character.new(object_pool, ai_input, 2, 2)
      expect(ai_vision.closest_player).to eq(nil)
    end
  end
end
