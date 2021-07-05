# frozen_string_literal: true

# Field map class.
class Map
  attr_accessor :text

  def initialize(object_pool, file)
    @object_pool = object_pool
    object_pool.map = self

    @text = File.read(Utils.media_path(file)).split("\n")
  end

  def draw(viewport)
    x0, x1, y0, y1 = viewport.map(&:to_i)
    map = @text.slice(y0..y1).map { |y| y.slice(x0..x1) }

    map.each_with_index do |line, index|
      $game.window.setpos(1 + index, 1)
      $game.window.addstr(line)
    end
  end

  def update
    @text = File.read(Utils.media_path('debug_map.txt')).split("\n")
    # TODO: Remove redundant
  end

  def can_move_to?(x, y)
    terrain = @text.map(&:chars)[y][x]
    case terrain
    when '#'
      false
    when '|'
      false
    else
      true
    end
  end
end
