# Information display
class HUD
  attr_accessor :message_display

  def initialize(object_pool, character)
    @object_pool = object_pool
    @character = character
    @message_display = MessageDisplay.new(self, object_pool, character)
  end

  def player=(character)
    @character = character
    @message_display.character = character
  end

  def update
    @message_display.update
  end

  def draw
    @message_display.draw
  end
end
