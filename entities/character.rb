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
  end
end
