# Field map class.
class Map
  RAW = <<MAP.freeze
  #---#
  |###|
  |###|
  |###|
  #---#
MAP

  def map_with_player(character)
    new_map = RAW.gsub(' ', '').split("\n").map(&:chars)
    new_map[character.y][character.x] = '@'
    new_map.map { |row| row }.map(&:join).join("\n")
  end
end
