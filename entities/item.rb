# frozen_string_literal: true

# Field items.
class Item < GameObject
  attr_reader :symbol
  attr_accessor :graphics

  def initialize(object_pool, x, y)
    super(object_pool, x, y)
    @symbol = ['🙐', '🙑', '🙒'].sample
    @graphics = ItemGraphics.new(self)
  end
end
