# Player, enemy character class.
# Can move.
class Character < GameObject
  attr_accessor :input

  def initialize(object_pool, input, x, y)
    super(object_pool, x, y)
    @input = input
    @input.control(self)
  end

  def draw
    $game.window.setpos(@y, @x)
    $game.window.addstr('@')
  end

  def move_to(x, y)
    old_x = @x
    old_y = @y
    move(x, y)

    return if @object_pool.map.can_move_to?(x, y)

    move(old_x, old_y)
    @object_pool.hud.message_display.add('Bump into a wall')
  end
end
