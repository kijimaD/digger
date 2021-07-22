# frozen_string_literal: true

# Roaming world.
class CharacterRoamingState < CharacterMotionState
  def initialize(object, vision)
    super
    @object = object
    @vision = vision
    @arrive_wall = false
  end

  def update
    if should_change_direction?
      @object.physics.turn_right
      @arrive_wall = true
    end

    @object.physics.turn_left if @vision.can_go_left? && @vision.can_go_forward? && @arrive_wall
    @object.physics.move_to_direction if FieldState.instance.execute
  end
end
