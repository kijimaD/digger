class Map
  RAW = <<MAP
  #---#
  |###|
  |###|
  |###|
  #---#
MAP

  def initialize
    map
  end

  def map_with_player(character)
    new_map = map
    new_map[character.y][character.x] = '@'
    new_map.map { |row| row }.map(&:join).join("\n")
  end

  def map
    RAW.gsub(' ', '').split("\n").map(&:chars)
  end
end
