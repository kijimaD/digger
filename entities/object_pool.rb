# Objects array.
class ObjectPool
  attr_accessor :objects, :map, :hud

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
  end

  def draw_all
    @objects.map(&:draw)
  end
end
