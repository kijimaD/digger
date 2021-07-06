# frozen_string_literal: true

# graphics
class CharacterGraphics < Component
  def initialize(game_object)
    super(game_object)
  end

  def draw
    object.object_pool.map(&:chars).text[object.y][object.x] = object.symbol
  end
end
