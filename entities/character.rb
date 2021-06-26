# Player, enemy character class.
# Can move.
class Character < GameObject
  def initialize
    super(1, 1)
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
