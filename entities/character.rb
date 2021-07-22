# frozen_string_literal: true

# Player, enemy character class.
# Can move.
class Character < GameObject
  attr_reader :stats, :input, :graphics, :type, :physics

  def initialize(object_pool, input, x, y)
    super(object_pool, x, y)
    @object_pool = object_pool
    @input = input
    @input.control(self)
    @stats = Stats.new
    @graphics = CharacterGraphics.new(self)
    @type = CharacterType.new(self)
    @physics = CharacterPhysics.new(self)
  end

  def on_collision(obj)
    obj.stats.add_message("#{obj.type.name} bump into a #{@type.name} (#{@x}, #{@y})")
    obj.stats.add_message("▶ #{input.motion.current_state.class}") if input.is_a?(AiInput)
  end
end
