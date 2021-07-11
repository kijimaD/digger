# frozen_string_literal: true

RSpec.describe Character do
  let(:object_pool) { ObjectPool.new }
  let(:input) { PlayerInput.new(object_pool) }
  let(:character) { described_class.new(object_pool, input, 1, 1) }

  before { Map.new(object_pool, 'test_map.txt') }

  describe '#move_to' do
    it 'can move' do
      expect { character.move_to(2, 2) }
        .to change { [character.x, character.y] }.from([1, 1]).to([2, 2])
    end
  end

  describe '#can_move_to?' do
    before { described_class.new(object_pool, input, 1, 2) }

    it { expect(character.can_move_to?(0, 0)).to be(false) }
    it { expect(character.can_move_to?(1, 2)).to be(false) }
    it { expect(character.can_move_to?(1, 3)).to be(true) }
  end

  describe '#draw' do
    it '#draw implemented in GameObject class' do
      expect(character.method(:draw).source_location[0]).to include('game_object.rb')
    end
  end

  describe '#update' do
    it '#update implemented in GameObject class' do
      expect(character.method(:update).source_location[0]).to include('game_object.rb')
    end
  end
end
