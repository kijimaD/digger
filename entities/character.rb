# Player, enemy character class.
# Can move.
class Character < GameObject
  attr_reader :stats, :input

  def initialize(object_pool, input, x, y)
    super(object_pool, x, y)
    @input = input
    @input.control(self)
    @stats = Stats.new
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
    stats.add_message("Bump into a wall(#{self.x}, #{self.y})")
  end
end
