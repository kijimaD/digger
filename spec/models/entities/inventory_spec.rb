# frozen_string_literal: true

RSpec.describe Inventory do
  let(:inventory) { described_class.instance }

  describe '#add' do
    it 'can push items' do
      expect { inventory.add(Object.new) }.to change { inventory.items.length }.by(1)
    end
  end
end
