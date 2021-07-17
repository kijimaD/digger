# frozen_string_literal: true

# Field items.
class Item < GameObject
  attr_reader :symbol, :type, :graphics

  def initialize(object_pool, x, y, type)
    super(object_pool, x, y)
    @symbol = '.'
    @graphics = ItemGraphics.new(self)
    @type = type
  end

  def on_collision(obj)
    obj.stats.add_message("Get #{@type.name} (#{obj.x}, #{obj.y})")
    Inventory.instance.add(self)
    mark_for_removal
  end
end
