# frozen_string_literal: true

# Player, enemy character class.
# Can move.
class Character < GameObject
  attr_reader :stats, :input, :symbol
  attr_accessor :graphics

  def initialize(object_pool, input, x, y)
    super(object_pool, x, y)
    @object_pool = object_pool
    @input = input
    @input.control(self)
    @stats = Stats.new
    @symbol = ['@', 't'].sample
    @graphics = CharacterGraphics.new(self)
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

    @object_pool.same_point_objects(self.x, self.y, self).each do |obj|
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
