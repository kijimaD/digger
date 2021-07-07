# frozen_string_literal: true

RSpec.describe Map do
  let!(:object_pool) { ObjectPool.new }
  let!(:map) { described_class.new(object_pool, 'debug_map.txt') }

  describe '#can_move_to?' do
    it { expect(map.can_move_to?(1, 1)).to be(true) }
    it { expect(map.can_move_to?(0, 0)).to be(false) }
    it { expect(map.can_move_to?(0, 1)).to be(false) }
  end
end
