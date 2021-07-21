# frozen_string_literal: true

# Character physics(movement, collision...) class.
class CharacterPhysics < Component
  attr_reader :direction

  def initialize(object)
    super(object)
    @object = object
    @object_pool = object.object_pool
    @direction = %i[up right down, left].sample
  end

  def move_to_direction
    case @direction
    when :up
      move_up
    when :right
      move_right
    when :down
      move_down
    when :left
      move_left
    end
  end

  def move_up
    move_to(@object.x, @object.y - 1)
  end

  def move_right
    move_to(@object.x + 1, @object.y)
  end

  def move_down
    move_to(@object.x, @object.y + 1)
  end

  def move_left
    move_to(@object.x - 1, @object.y)
  end

  def move_to(x, y)
    return unless can_move_to?(x, y)

    @object.move(x, y)
    true
  end

  # rubocop: disable Metrics/MethodLength, Metrics/AbcSize
  def can_move_to?(x, y)
    old_x = @object.x
    old_y = @object.y
    @object.move(x, y)

    unless @object_pool.world.can_move_to?(x, y)
      terrain = @object_pool.world.world[y][x]
      @object.stats.add_message("Bump into a #{terrain.id} #{terrain.symbol} (#{@object.x}, #{@object.y})")
      return false
    end

    @object_pool.same_point_objects(@object.x, @object.y, @object).each do |obj|
      case obj
      when Character
        obj.on_collision(@object)
        return false
      when Item
        break if @object.input.is_a?(AiInput)

        obj.on_collision(@object)
      end
    end

    true
  ensure
    @object.move(old_x, old_y)
  end
  # rubocop: enable Metrics/MethodLength, Metrics/AbcSize
end
