# frozen_string_literal: true

RSpec.describe ItemType do
  let(:object_pool) { ObjectPool.new }
  let(:game_object) { GameObject.new(object_pool, 1, 1) }
  let(:item_type) { described_class.new(game_object) }

  describe '#initialize' do
    it '#initialize' do
      expect(item_type.name).to be_truthy
    end
  end
end
