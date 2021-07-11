# frozen_string_literal: true

# graphics
class CharacterGraphics < Component
  def draw
    object.object_pool.map(&:chars).text[object.y][object.x] = object.type.symbol
  end
end
