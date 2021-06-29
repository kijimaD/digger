# Abstruct class.
# GameObject is exist on map. etc) character, item
class GameObject
  attr_reader :x, :y, :object_pool, :components

  def initialize(object_pool, x, y)
    @x = x
    @y = y
    @object_pool = object_pool
    @object_pool.add(self)
    @components = []
  end

  def move(new_x, new_y)
    return if new_x == @x && new_y == @y

    @x = new_x
    @y = new_y
  end

  def draw
    @components.map(&:draw)
  end

  def update
    @components.map(&:update)
  end
end
