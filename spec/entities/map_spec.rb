require_relative '../../entities/map'
require_relative '../../entities/game_object'
require_relative '../../entities/character'

RSpec.describe Map do
  it '#can_move_to?' do
    map = Map.new('test_map.txt')
    expect(map.can_move_to?(1, 1)).to be(true)
    expect(map.can_move_to?(0, 0)).to be(false)
  end
end
