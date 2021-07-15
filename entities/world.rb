# frozen_string_literal: true

# Field world class.
class World
  attr_accessor :text
  attr_reader :world, :terrain_pool

  def initialize(object_pool, file)
    @object_pool = object_pool
    object_pool.world = self

    @file = file
    @text = load_text.split("\n")
    @terrain_pool = generate_terrain
    @world = terrain_mapping
  end

  def draw(viewport)
    x0, x1, y0, y1 = viewport.map(&:to_i)
    world = @text.slice(y0..y1).map { |y| y.slice(x0..x1) }

    world.each_with_index do |line, index|
      $game.window.setpos(1 + index, 1)
      $game.window.addstr(line)
    end
  end

  def update
    @text = load_text.split("\n")
  end

  def generate_terrain
    terrain_pool = []
    Utils.load_json('terrain.json').each do |obj|
      terrain_pool << Terrain.new(obj[:id], obj[:symbol], obj[:passable])
    end
    terrain_pool
  end

  def terrain_mapping
    result = []
    load_text.split("\n").each do |row|
      result << row.chars.map do |c|
        @terrain_pool.find { |t| t.symbol == c }
        # TODO: performance problem
      end
    end
    result
  end

  def can_move_to?(x, y)
    @world[y][x].passable
  end

  def load_text
    @load_text ||= File.read(Utils.media_path(@file))
  end

  def world_width
    @world_width ||= @text.first.length
  end

  def world_height
    @world_height ||= @text.length
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
      x = rand(0..(world_width - 1))
      y = rand(0..(world_height - 1))
      return [x, y] if can_move_to?(x, y) && @object_pool.same_point_objects(x, y).empty?
    end
  end
end
