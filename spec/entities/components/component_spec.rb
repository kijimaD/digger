RSpec.describe Component do
  it 'initialize' do
    object_pool = ObjectPool.new
    character = Character.new(object_pool, PlayerInput.new(object_pool), 1, 1)
    expect(character.components.length).to eq(1)
    Component.new(character)
    expect(character.components.length).to eq(2)
  end
end
