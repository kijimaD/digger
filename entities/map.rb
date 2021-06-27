# Field map class.
class Map
  attr_reader :text

  def initialize(file)
    @text = File.read(Utils.media_path(file))
    @map = @text.split("\n").map(&:chars)
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
