# frozen_string_literal: true

# graphics
class CharacterGraphics < Component
  def initialize(object)
    super(object)
    @object = object
    @object_pool = object.object_pool
  end

  def draw
    @object_pool.map(&:chars).text[@object.y][@object.x] = @object.type.symbol
  end
end
