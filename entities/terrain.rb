# frozen_string_literal: true

# World is composed by terrain.
class Terrain
  attr_reader :symbol, :passable

  def initialize(symbol, passable)
    @symbol = symbol
    @passable = passable
  end
end
