RSpec.describe Character do
  let(:object_pool) { ObjectPool.new }
  let(:input) { AiInput.new(object_pool) }
  let(:character) { Character.new(object_pool, input, 1, 1) }
  let!(:map) { Map.new(object_pool, 'test_map.txt') }

  it '#move_to' do
    expect(character.x).to eq 1
    expect(character.y).to eq 1

    character.move_to(2, 2)

    expect(character.x).to eq 2
    expect(character.y).to eq 2
  end

  it '#can_move_to?' do
    Character.new(object_pool, input, 1, 2)

    expect(character.can_move_to?(0, 0)).to be(false) # map
    expect(character.can_move_to?(1, 2)).to be(false) # character
    expect(character.can_move_to?(1, 3)).to be(true)
  end
end
