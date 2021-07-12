# frozen_string_literal: true

RSpec.describe Terrain do
  describe '#initialize' do
    it 'have passable parameter' do
      wall = described_class.new('#', false)
      expect(wall.passable).to be(false)
    end
  end
end
