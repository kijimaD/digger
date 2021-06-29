# Player input(move, get item...) class.
class PlayerInput < Component
  def initialize(object_pool)
    super(nil)
    @object_pool = object_pool
  end

  def control(obj)
    self.object = obj
  end

  def button_down(char)
    case char
    when 'w'
      object.move_to(object.x, object.y - 1) # up
      # object.hud.message_display.add('Move up')
    when 'a'
      object.move_to(object.x - 1, object.y) # left
      # object.hud.message_display.add('Move left')
    when 's'
      object.move_to(object.x, object.y + 1) # down
      # object.hud.message_display.add('Move down')
    when 'd'
      object.move_to(object.x + 1, object.y) # right
      # object.hud.message_display.add('Move right')
    when 'c'
      exit
    else
      # object.hud.message_display.add('Invalid key')
    end
  end
end
