# Field map class.
class Map
  def initialize(file)
    @text = File.read(Utils.media_path(file))
    @map = text_to_array
  end

  def map_with_player(character)
    new_map = text_to_array
    new_map[character.y][character.x] = '@'
    new_map.map { |row| row }.map(&:join).join("\n")
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

  private

  def text_to_array
    @text.split("\n").map(&:chars)
  end
end
