# frozen_string_literal: true

# Message display.
class MessageDisplay < Component
  MESSAGE_X = 50
  MESSAGE_Y = 1

  def initialize(hud, object_pool, character)
    super(nil)
    @hud = hud
    @object_pool = object_pool
    @character = character
    @messages = []
  end

  def draw
    coordinate if $debug
    log_messages
  end

  def update; end

  private

  def coordinate
    $game.window.setpos(MESSAGE_Y, MESSAGE_X)
    $game.window.addstr("Execute: #{FieldState.instance.execute} (#{@character.x}, #{@character.y})")
  end

  def log_messages
    @character.stats.messages.each.with_index(1) do |message, i|
      $game.window.setpos(MESSAGE_Y + i, MESSAGE_X)
      $game.window.addstr("#{i.to_s.ljust(2)}: " + message.to_s)
    end
  end
end
