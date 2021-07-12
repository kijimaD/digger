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
    objects.select do |obj|
      obj.x == x && obj.y == y && object != obj # filter self object
    end
  end
end
