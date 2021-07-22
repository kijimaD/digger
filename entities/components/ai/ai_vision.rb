# frozen_string_literal: true

# AI vision.
class AiVision
  def initialize(viewer, object_pool, distance)
    @viewer = viewer
    @object_pool = object_pool
    @distance = distance
    in_sight
  end

  def update
    in_sight
  end

  def closest_player
    @closest_player = find_closest_player
  end

  def in_sight
    @in_sight = @object_pool.nearby(@viewer, @distance)
  end

  def can_go_forward?
    in_front = Utils.point_at_distance(@viewer.x, @viewer.y, @viewer.physics.direction, 1)
    @viewer.physics.can_move_to?(*in_front)
  end

  def can_go_left?
    direction = (@viewer.physics.direction - 90) % 360
    in_left = Utils.point_at_distance(@viewer.x, @viewer.y, direction, 1)
    @viewer.physics.can_move_to?(*in_left)
  end

  def can_go_right?
    direction = (@viewer.physics.direction + 90) % 360
    in_right = Utils.point_at_distance(@viewer.x, @viewer.y, direction, 1)
    @viewer.physics.can_move_to?(*in_right)
  end

  private

  # rubocop:disable Metrics/AbcSize
  def find_closest_player
    @in_sight.select { |obj| obj.instance_of?(Character) && obj.input.instance_of?(PlayerInput) }.min do |a, b|
      d1 = Utils.distance_between(@viewer.x, @viewer.y, a.x, a.y)
      d2 = Utils.distance_between(@viewer.x, @viewer.y, b.x, b.y)
      d1 <=> d2
    end
  end
  # rubocop:enable Metrics/AbcSize
end
