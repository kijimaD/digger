class Character
  attr_accessor :x, :y

  def initialize
    @x = 1
    @y = 1
  end

  def up
    @y -= 1
  end

  def down
    @y += 1
  end

  def right
    @x += 1
  end

  def left
    @x -= 1
  end
end
