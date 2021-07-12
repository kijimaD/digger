# frozen_string_literal: true

# Field items.
class Item < GameObject
  attr_reader :symbol, :type, :graphics

  def initialize(object_pool, x, y)
    super(object_pool, x, y)
    @symbol = '🗃'
    @graphics = ItemGraphics.new(self)
    @type = ItemType.new(self)
  end
end
