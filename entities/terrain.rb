# frozen_string_literal: true

# World is composed by terrain.
class Terrain
  attr_reader :symbol, :passable, :name

  def initialize(name, symbol, passable)
    @name = name
    @symbol = symbol
    @passable = passable
  end
end
