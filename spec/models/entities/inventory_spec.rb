# frozen_string_literal: true

RSpec.describe Inventory do
  let(:object_pool) { ObjectPool.new }
  let(:inventory) { described_class.send(:new) }
  let(:item_type) { ItemType.new('portion', '回復薬', '回復する', :consumption) }
  let(:item) { Item.new(object_pool, 2, 2, item_type) }

  describe '#add' do
    it 'can push items' do
      expect { inventory.add(item) }.to change { inventory.items.length }.by(1)
    end
  end
end
