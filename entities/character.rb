# frozen_string_literal: true

# Player, enemy character class.
# Can move.
class Character < GameObject
  attr_reader :stats, :input

  def initialize(object_pool, input, x, y)
    super(object_pool, x, y)
    @object_pool = object_pool
    @input = input
    @input.control(self)
    @stats = Stats.new
    @symbol = ['@', 't'].sample
  end

  def draw; end

  def update
    object_pool.map(&:chars).text[@y][@x] = @symbol
  end

  def move_to(x, y)
    move(x, y) if can_move_to?(x, y)
  end

  # rubocop: disable Metrics/MethodLength
  def can_move_to?(x, y)
    old_x = @x
    old_y = @y
    move(x, y)

    unless @object_pool.map.can_move_to?(x, y)
      stats.add_message("Bump into a wall(#{self.x}, #{self.y})")
      return false
    end

    @object_pool.same_point_objects(self).each do |obj|
      if obj.is_a? Character
        stats.add_message("Bump into a chara(#{self.x}, #{self.y})")
        return false
      end
    end

    true
  ensure
    move(old_x, old_y)
  end
  # rubocop: enable Metrics/MethodLength
end
