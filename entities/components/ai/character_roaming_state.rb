# frozen_string_literal: true

# Roaming world.
class CharacterRoamingState < CharacterMotionState
  def initialize(object, vision)
    super
    @object = object
    @vision = vision
  end

  def update
    @object.physics.turn_right if should_change_direction?
    @object.physics.move_to_direction if FieldState.instance.execute
  end
end
