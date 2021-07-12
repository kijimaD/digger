# frozen_string_literal: true

# Item graphics.
class ItemGraphics < Component
  def initialize(object)
    super(object)
    @object = object
    @object_pool = object.object_pool
  end

  def draw
    @object_pool.world(&:chars).text[@object.y][@object.x] = @object.symbol
  end
end
