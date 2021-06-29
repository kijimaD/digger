RSpec.describe Map do
  let(:object_pool) { ObjectPool.new }

  it '#size' do
    expect(object_pool.size).to eq(0)
    Character.new(object_pool, PlayerInput.new(object_pool), 1, 1)
    expect(object_pool.size).to eq(1)
  end

  it '#add' do
    obj = Object.new

    object_pool.add(obj)
    expect(object_pool.objects).to eq([obj])
  end

  it '#update_all' do
    game_object_mock = double
    expect(game_object_mock).to receive(:update)

    object_pool.add(game_object_mock)
    object_pool.update_all
  end

  it '#draw_all' do
    game_object_mock = double
    expect(game_object_mock).to receive(:draw)

    object_pool.add(game_object_mock)
    object_pool.draw_all
  end
end
