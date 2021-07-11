# frozen_string_literal: true

# NPC character input.
class AiInput < Component
  def initialize(object_pool)
    super(nil)
    @object_pool = object_pool
  end

  def control(obj)
    self.object = obj
  end

  def update
    random_move
  end

  def random_move
    object.physics.move_to(object.x + rand(-1..1), object.y + rand(-1..1)) if FieldState.instance.execute
  end
end
