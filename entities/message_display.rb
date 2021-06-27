# Message display.
class MessageDisplay
  def initialize(object_pool, character)
    # TODO: Remove redundunt object_pool description.
    @object_pool = object_pool
    object_pool.add(self)
    object_pool.message = self
    @character = character
    @messages = []
  end

  def draw
    $game.window.setpos(0, 30)
    $game.window.addstr("(#{@character.x}, #{@character.y})")

    (1..6).each do |i|
      $game.window.setpos(i, 30)
      $game.window.addstr(@messages[-i])
    end
  end

  def add(message)
    @messages << message
  end
end
