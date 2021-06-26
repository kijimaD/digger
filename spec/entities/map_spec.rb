require_relative '../../entities/map'
require_relative '../../entities/game_object'
require_relative '../../entities/character'

RSpec.describe Map do
  it '#map_with_player' do
    character = Character.new
    map = Map.new('test_map.txt')
    test_before =
      '#####
#@  #
#   #
#   #
#####'
    expect(map.map_with_player(character)).to eq(test_before)

    character.right
    test_after =
      '#####
# @ #
#   #
#   #
#####'
    expect(map.map_with_player(character)).to eq(test_after)

    character.up
    character.down
    expect(map.map_with_player(character)).to eq(test_after)

    character.left
    expect(map.map_with_player(character)).to eq(test_before)
  end
end
