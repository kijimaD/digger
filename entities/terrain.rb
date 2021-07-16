# frozen_string_literal: true

# World is composed by terrain.
class Terrain
  attr_reader :id, :symbol, :passable

  def initialize(id, symbol, passable)
    @id = id
    @symbol = symbol
    @passable = passable
  end
end
