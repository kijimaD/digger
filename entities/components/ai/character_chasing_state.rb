# frozen_string_literal: true

# Chasing state. If ai find player, chase it.
class CharacterChasingState < CharacterMotionState
  def initialize(object, vision)
    super
    @object = object
    @vision = vision
  end

  def update
    chase
  end

  def chase
    angle = Utils.angle_between(@object.x, @object.y, @vision.target.x, @vision.target.y)
    @object.physics.direction = Utils.angle_quarter(angle)

    @object.physics.move_to_direction if FieldState.instance.execute
  end
end
