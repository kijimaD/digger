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

  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  def button_down(char)
    case char
    when 'w'
      object.move_to(object.x, object.y - 1) # up
    when 'a'
      object.move_to(object.x - 1, object.y) # left
    when 's'
      object.move_to(object.x, object.y + 1) # down
    when 'd'
      object.move_to(object.x + 1, object.y) # right
    when ' '
      nil
    when 'c'
      exit
    else
      object.stats.add_message('Invalid key')
    end
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize
end
