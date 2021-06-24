require_relative '../../entities/map'
require_relative '../../entities/character'

RSpec.describe Map do
  it '#map_with_player' do
    character = Character.new
    test_before =
      '#---#
|@##|
|###|
|###|
#---#'

    Map.new.map_with_player(character)
    expect(Map.new.map_with_player(character)).to eq(test_before)

    character.right
    test_after =
      '#---#
|#@#|
|###|
|###|
#---#'
    expect(Map.new.map_with_player(character)).to eq(test_after)

    character.up
    character.down
    expect(Map.new.map_with_player(character)).to eq(test_after)

    character.left
    expect(Map.new.map_with_player(character)).to eq(test_before)
  end
end
