# frozen_string_literal: true

RSpec.describe Terrain do
  describe '#initialize' do
    it 'have passable parameter' do
      wall = described_class.new('#', false, 'plain')
      expect([wall.symbol, wall.passable, wall.name]).to match(['#', false, 'plain'])
    end
  end
end
