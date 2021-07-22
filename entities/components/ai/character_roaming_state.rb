# frozen_string_literal: true

# Roaming world.
class CharacterRoamingState < CharacterMotionState
  def initialize(object, vision)
    super
    @object = object
    @vision = vision
  end
end
