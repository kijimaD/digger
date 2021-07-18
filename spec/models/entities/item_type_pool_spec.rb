# frozen_string_literal: true

RSpec.describe ItemTypePool do
  let(:item_type_pool) { described_class.new }

  describe '#initialize' do
    it 'enough pool length' do
      expect(item_type_pool.types.length).to be > 10
    end

    it 'can access attribute' do
      expect { item_type_pool.types[0].id }.not_to raise_error
    end

    it 'can get category' do
      expect(item_type_pool.types.count { |t| t.category == :canon }).to be > 10
    end
  end
end
