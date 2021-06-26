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

    character.move(character.x + 1, character.y) # right
    test_after =
      '#####
# @ #
#   #
#   #
#####'
    expect(map.map_with_player(character)).to eq(test_after)

    character.move(character.x, character.y - 1) # up
    character.move(character.x, character.y + 1) # down
    expect(map.map_with_player(character)).to eq(test_after)

    character.move(character.x - 1, character.y) # left
    expect(map.map_with_player(character)).to eq(test_before)
  end

  it '#can_move_to?' do
    map = Map.new('test_map.txt')
    expect(map.can_move_to?(1, 1)).to be(true)
    expect(map.can_move_to?(0, 0)).to be(false)
  end
end
