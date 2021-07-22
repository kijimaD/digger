# frozen_string_literal: true

# NPC character input.
class AiInput < Component
  attr_accessor :vision, :motion

  def initialize(object_pool)
    super(nil)
    @object_pool = object_pool
  end

  def control(obj)
    self.object = obj
    @vision = AiVision.new(obj, @object_pool, rand(6..10))
    @motion = CharacterMotionFSM.new(obj, @vision)
  end

  def update
    @vision.update
    @motion.update
  end
end
