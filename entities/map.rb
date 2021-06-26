# Field map class.
class Map
  def initialize(file)
    @text_file = File.read(Utils.media_path(file))
  end

  def map_with_player(character)
    new_map = @text_file.split("\n").map(&:chars)
    new_map[character.y][character.x] = '@'
    new_map.map { |row| row }.map(&:join).join("\n")
  end
end
