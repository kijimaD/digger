# frozen_string_literal: true

RSpec.describe Inventory do
  let(:object_pool) { ObjectPool.new }
  let(:inventory) { described_class.new }

  describe '#add' do
    context 'when get consumption category item' do
      let(:item_type) { ItemType.new('portion', '回復薬', '回復する', :consumption) }
      let(:item) { Item.new(object_pool, 2, 2, item_type) }

      it 'can push items' do
        expect { inventory.add(item) }.to change { inventory.items.length }.by(1)
      end

      it 'count not change' do
        expect { inventory.add(item) }.to change { item.type.count }.by(0)
      end
    end

    context 'when get material category item' do
      let(:item_type) { ItemType.new('small_flower', '小さな花', '赤い花', :material) }
      let(:item) { Item.new(object_pool, 2, 2, item_type) }

      it 'not push items' do
        expect { inventory.add(item) }.to change { inventory.items.length }.by(0)
      end

      it 'increment count' do
        expect { inventory.add(item) }.to change { item.type.count }.by(1)
      end
    end
  end
end
