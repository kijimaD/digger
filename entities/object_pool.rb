# frozen_string_literal: true

# Objects array.
class ObjectPool
  attr_accessor :objects, :world, :hud, :camera

  def initialize
    @objects = []
  end

  def size
    @objects.size
  end

  def add(object)
    @objects << object
  end

  def update_all
    @objects.map(&:update)
    @objects.reject!(&:removable?)
  end

  def draw_all
    @objects.map(&:draw)
  end

  def same_point_objects(x, y, object = nil)
    @objects.select do |obj|
      obj.x == x && obj.y == y && obj != object # filter self object
    end
  end

  def nearby(object, max_distance, min_distance = 0)
    nearby_point(object.x, object.y, max_distance, min_distance, object)
  end

  def nearby_point(cx, cy, max_distance, min_distance = 0, object = nil)
    @objects.select do |o|
      o != object &&
        Utils.distance_between(o.x, o.y, cx, cy) <= max_distance &&
        Utils.distance_between(o.x, o.y, cx, cy) >= min_distance
    end
  end
end
