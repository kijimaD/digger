# Player, enemy character class.
# Can move.
class Character < GameObject
  def initialize(object_pool)
    super(object_pool, 1, 1)
  end

  def draw
    $game.window.setpos(@y, @x)
    $game.window.addstr('@')
  end

  def move_to(x, y)
    old_x = @x
    old_y = @y
    move(x, y)
    move(old_x, old_y) unless @object_pool.map.can_move_to?(x, y)
  end
end
