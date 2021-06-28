# Message display.
class MessageDisplay
  attr_reader :messages

  LOG_LENGTH = 10
  MESSAGE_X = 30
  MESSAGE_Y = 0

  def initialize(object_pool, character)
    # TODO: Remove redundunt object_pool description.
    @object_pool = object_pool
    object_pool.message = self
    @character = character
    @messages = []
  end

  def draw
    $game.window.setpos(MESSAGE_Y, MESSAGE_X)
    $game.window.addstr("(#{@character.x}, #{@character.y})")

    @messages.each.with_index(1) do |message, i|
      $game.window.setpos(MESSAGE_Y + i, MESSAGE_X)
      $game.window.addstr(message)
    end
  end

  def update
    latest_messages
  end

  def add(message)
    @messages << message
  end

  def latest_messages
    @messages.shift while @messages.length > LOG_LENGTH
  end
end
