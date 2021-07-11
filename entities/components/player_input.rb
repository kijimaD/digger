# frozen_string_literal: true

# Player input(move, get item...) class.
class PlayerInput < Component
  def initialize(object_pool)
    super(nil)
    @object_pool = object_pool
  end

  def control(obj)
    self.object = obj
  end

  def move_to(x, y)
    FieldState.instance.execute = object.physics.move_to(x, y) ? true : false
  end

  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  def button_down(char)
    case char
    when 'w'
      move_to(object.x, object.y - 1) # up
    when 'a'
      move_to(object.x - 1, object.y) # left
    when 's'
      move_to(object.x, object.y + 1) # down
    when 'd'
      move_to(object.x + 1, object.y) # right
    when ' '
      FieldState.instance.execute = true
    when 'c'
      exit
    end
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize
end
