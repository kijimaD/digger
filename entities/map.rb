# frozen_string_literal: true

# Field map class.
class Map
  attr_accessor :text

  def initialize(object_pool, file)
    @object_pool = object_pool
    object_pool.map = self

    @file = file
    @text = load_text.split("\n")
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
    @text = load_text.split("\n")
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

  def load_text
    @load_text ||= File.read(Utils.media_path(@file))
  end

  def map_width
    @map_width ||= @text.first.length
  end

  def map_height
    @map_height ||= @text.length
  end

  def spawn_point
    @spawn_points.pop
  end

  def spawn_points(max)
    @spawn_points_pointer = 0
    @spawn_points = (0..(max - 1)).map do
      find_spawn_point
    end
  end

  def find_spawn_point
    loop do
      x = rand(0..(map_width - 1))
      y = rand(0..(map_height - 1))
      return [x, y] if can_move_to?(x, y) && @object_pool.same_point_objects(x, y).empty?
    end
  end
end
