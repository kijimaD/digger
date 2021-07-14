# frozen_string_literal: true

RSpec.describe World do
  let!(:object_pool) { ObjectPool.new }
  let!(:world) { described_class.new(object_pool, 'test_map.txt') }

  describe '#can_move_to?' do
    it { expect(world.can_move_to?(1, 1)).to be(true) }
    it { expect(world.can_move_to?(0, 0)).to be(false) }
    it { expect(world.can_move_to?(0, 1)).to be(false) }
  end

  describe '#spawn_point' do
    it 'return array' do
      world.spawn_points(10)
      expect(world.spawn_point).to be_kind_of(Array)
    end

    it 'return object is [x, y]' do
      world.spawn_points(10)
      expect(world.spawn_point.length).to eq(2)
    end
  end

  describe '#spawn_points' do
    it 'return array length is equal or smaller than MAX' do
      expect(world.spawn_points(10).length <= 10).to eq(true)
    end
  end

  describe '#find_spawn_point' do
    it 'return array' do
      expect(world.find_spawn_point).to be_kind_of(Array)
    end

    it 'return object is [x, y]' do
      expect(world.find_spawn_point.length).to eq(2)
    end
  end

  describe '#generate_terrain' do
    it 'set @world' do
      world.generate_terrain
      expect(world.world).to be_truthy
    end
  end

  describe '#terrain_mapping' do
    it 'convert string world to terrain object world' do
      expect(world.terrain_mapping[0][0].symbol).to eq('#')
    end
  end
end
