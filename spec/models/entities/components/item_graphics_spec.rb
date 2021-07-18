# frozen_string_literal: true

RSpec.describe ItemGraphics do
  let(:object_pool) { ObjectPool.new }

  describe '#initialize' do
    it 'generate graphics' do
      item = Item.new(object_pool, 2, 2, ItemType.new('portion', '回復薬', '回復する', :consumption))
      expect(item.graphics).to be_truthy
    end
  end
end
