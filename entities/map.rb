# frozen_string_literal: true

# Field map class.
class Map
  attr_reader :text

  def initialize(object_pool, file)
    @object_pool = object_pool
    object_pool.map = self

    @text = File.read(Utils.media_path(file))
    @map = @text.split("\n").map(&:chars)
  end

  def draw
    $game.window.setpos(0, 0)
    $game.window.addstr(@text)
  end

  def can_move_to?(x, y)
    terrain = @map[y][x]
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
