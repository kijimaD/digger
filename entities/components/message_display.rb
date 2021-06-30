# Message display.
class MessageDisplay < Component
  attr_reader :messages

  LOG_LENGTH = 10
  MESSAGE_X = 30
  MESSAGE_Y = 0

  # TODO: Divide message and display

  def initialize(hud, object_pool, character)
    super(nil)
    @hud = hud
    @object_pool = object_pool
    @character = character
    @messages = []
  end

  def draw
    $game.window.setpos(MESSAGE_Y, MESSAGE_X)
    $game.window.addstr("(#{@character.x}, #{@character.y})")

    @messages.each.with_index(1) do |message, i|
      $game.window.setpos(MESSAGE_Y + i, MESSAGE_X)
      $game.window.addstr("#{i.to_s.ljust(2)}: " + "#{message}")
    end
  end

  def update; end

  def add(message)
    @messages << message
    @messages.shift while @messages.length > LOG_LENGTH
  end
end
