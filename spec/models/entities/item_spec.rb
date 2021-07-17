# frozen_string_literal: true

RSpec.describe Item do
  let(:object_pool) { ObjectPool.new }
  let(:item_type) { ItemType.new('portion', '回復薬', '回復する', :consumption) }

  describe '#initialize' do
    it 'can initialize' do
      described_class.new(object_pool, 2, 2, item_type)
      expect(object_pool.objects.length).to eq(1)
    end
  end
end
