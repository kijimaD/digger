require_relative '../../../entities/game_object'
require_relative '../../../entities/components/component'

RSpec.describe Component do
  it 'initialize' do
    object_pool = ObjectPool.new
    character = Character.new(object_pool, 1, 1)
    expect(character.components.length).to eq(0)
    Component.new(character)
    expect(character.components.length).to eq(1)
  end
end
