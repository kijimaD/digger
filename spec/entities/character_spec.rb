require_relative '../../entities/game_object'
require_relative '../../entities/character'

RSpec.describe Character do
  let(:object_pool) { ObjectPool.new }
  let(:input) { AiInput.new(object_pool) }
  let(:character) { Character.new(object_pool, input, 1, 1) }

  it '#move_to' do
    Map.new(object_pool, 'test_map.txt')

    expect(character.x).to eq 1
    expect(character.y).to eq 1

    character.move_to(2, 2)

    expect(character.x).to eq 2
    expect(character.y).to eq 2
  end
end
