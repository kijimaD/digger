RSpec.describe PlayerInput do
  let(:object_pool) { ObjectPool.new }
  let(:input) { PlayerInput.new(object_pool) }
  let(:character) { Character.new(object_pool, input, 1, 1) }

  it '#control' do
    input.control(character)
    expect(input.object).to eq character
  end

  it 'button_down' do
    expect { input.button_down('c') }.to raise_error SystemExit
  end
end
