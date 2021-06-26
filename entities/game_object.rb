# Abstruct class.
class GameObject
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def move(new_x, new_y)
    return if new_x == @x && new_y == @y

    @x = new_x
    @y = new_y
  end
end
