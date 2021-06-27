# Abstruct class.
class GameObject
  attr_reader :x, :y

  def initialize(object_pool, x, y)
    @x = x
    @y = y
    @object_pool = object_pool
    @object_pool.add(self)
  end

  def move(new_x, new_y)
    return if new_x == @x && new_y == @y

    @x = new_x
    @y = new_y
  end

  def draw
  end

  protected

  def object_pool
    @object_pool
  end
end
