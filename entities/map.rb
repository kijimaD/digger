# frozen_string_literal: true

# Field map class.
class Map
  def initialize(object_pool, file)
    @object_pool = object_pool
    object_pool.map = self

    @text = File.read(Utils.media_path(file)).split("\n")
  end

  def draw
    @text.each_with_index do |line, index|
      $game.window.setpos(1 + index, 1)
      $game.window.addstr(line)
    end
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
