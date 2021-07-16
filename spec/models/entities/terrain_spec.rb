# frozen_string_literal: true

RSpec.describe Terrain do
  describe '#initialize' do
    it 'have passable parameter' do
      wall = described_class.new('plain', '#', false)
      expect([wall.id, wall.symbol, wall.passable]).to match(['plain', '#', false])
    end
  end
end
