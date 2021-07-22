# frozen_string_literal: true

# Motion state abstruct class.
class CharacterMotionState
  def initialize(object, vision)
    @object = object
    @vision = vision
  end

  def enter
    # override
  end

  def change_direction
    # override
  end

  def wait_time
    # override
  end

  def drive_time
    # override
  end

  def update
    # override
  end
end
