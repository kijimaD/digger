# frozen_string_literal: true

RSpec.describe Map do
  let!(:object_pool) { ObjectPool.new }
  let!(:map) { described_class.new(object_pool, 'debug_map.txt') }

  describe '#can_move_to?' do
    it { expect(map.can_move_to?(1, 1)).to be(true) }
    it { expect(map.can_move_to?(0, 0)).to be(false) }
    it { expect(map.can_move_to?(0, 1)).to be(false) }
  end

  describe '#spawn_point' do
    it 'return array' do
      map.spawn_points(10)
      expect(map.spawn_point).to be_kind_of(Array)
    end

    it 'return object is [x, y]' do
      map.spawn_points(10)
      expect(map.spawn_point.length).to eq(2)
    end
  end

  describe '#spawn_points' do
    it 'return array length is equal or smaller than MAX' do
      expect(map.spawn_points(10).length <= 10).to eq(true)
    end
  end

  describe '#find_spawn_point' do
    it 'return array' do
      expect(map.find_spawn_point).to be_kind_of(Array)
    end

    it 'return object is [x, y]' do
      expect(map.find_spawn_point.length).to eq(2)
    end
  end
end
