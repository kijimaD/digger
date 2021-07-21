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

  # rubocop:disable Metrics/MethodLength
  def button_down(char)
    result = case char
             when 'w'
               object.physics.move_up
             when 'a'
               object.physics.move_left
             when 's'
               object.physics.move_down
             when 'd'
               object.physics.move_right
             when ' '
               true
             end
    FieldState.instance.execute = result ? true : false
  end
  # rubocop:enable Metrics/MethodLength
end
