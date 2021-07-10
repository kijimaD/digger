# frozen_string_literal: true

# Player, enemy character class.
# Can move.
class Character < GameObject
  attr_reader :stats, :input
  attr_accessor :graphics, :symbol, :name

  def initialize(object_pool, input, x, y)
    super(object_pool, x, y)
    @object_pool = object_pool
    @input = input
    @input.control(self)
    @stats = Stats.new
    @graphics = CharacterGraphics.new(self)
    @type = CharacterType.new(self).new_character
  end

  def move_to(x, y)
    move(x, y) if can_move_to?(x, y)
  end

  # rubocop: disable Metrics/MethodLength, Metrics/AbcSize
  def can_move_to?(x, y)
    old_x = @x
    old_y = @y
    move(x, y)

    unless @object_pool.map.can_move_to?(x, y)
      stats.add_message("Bump into a wall(#{self.x}, #{self.y})")
      return false
    end

    @object_pool.same_point_objects(self.x, self.y, self).each do |obj|
      case obj
      when Character
        stats.add_message("Bump into a chara(#{self.x}, #{self.y})")
        return false
      when Item
        stats.add_message("Get item(#{self.x}, #{self.y})")
        obj.mark_for_removal
      end
    end

    true
  ensure
    move(old_x, old_y)
  end
  # rubocop: enable Metrics/MethodLength, Metrics/AbcSize
end
