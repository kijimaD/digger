# frozen_string_literal: true

RSpec.describe Inventory do
  let(:inventory) { described_class.instance }

  describe '#add' do
    it 'can push items' do
      inventory.add(Object.new)
      expect(inventory.items.length).to eq(1)
    end
  end
end
