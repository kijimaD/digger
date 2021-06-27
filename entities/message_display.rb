# Message display.
class MessageDisplay
  attr_reader :messages

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

    (1..10).each do |i|
      $game.window.setpos(i, 30)
      $game.window.addstr(@messages[-i])
    end
  end

  def update
    latest_messages
  end

  def add(message)
    @messages << message
  end

  def latest_messages
    @messages.pop while @messages.length > 10
  end
end
