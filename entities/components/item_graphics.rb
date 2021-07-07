# frozen_string_literal: true

# Item graphics.
class ItemGraphics < Component
  def draw
    object.object_pool.map(&:chars).text[object.y][object.x] = object.symbol
  end
end
