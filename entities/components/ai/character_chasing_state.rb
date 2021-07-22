# frozen_string_literal: true

# Chasing state. If ai find player, chase it.
class CharacterChasingState < CharacterMotionState
  def initialize(object, vision)
    super
    @object = object
    @vision = vision
  end
end
