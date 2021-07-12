# frozen_string_literal: true

# World is composed by terrain.
class Terrain
  attr_reader :symbol, :passable, :name

  def initialize(symbol, passable, name)
    @symbol = symbol
    @passable = passable
    @name = name
  end
end
