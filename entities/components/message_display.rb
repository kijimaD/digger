# frozen_string_literal: true

# Message display.
class MessageDisplay < Component
  MESSAGE_X = 30
  MESSAGE_Y = 0

  def initialize(hud, object_pool, character)
    super(nil)
    @hud = hud
    @object_pool = object_pool
    @character = character
    @messages = []
  end

  def draw
    coordinate
    log_messages
  end

  def update; end

  private

  def coordinate
    $game.window.setpos(MESSAGE_Y, MESSAGE_X)
    $game.window.addstr("(#{@character.x}, #{@character.y})")
  end

  def log_messages
    @character.stats.messages.each.with_index(1) do |message, i|
      $game.window.setpos(MESSAGE_Y + i, MESSAGE_X)
      $game.window.addstr("#{i.to_s.ljust(2)}: " + message.to_s)
    end
  end
end
