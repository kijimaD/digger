require_relative '../../../entities/components/component'
require_relative '../../../entities/components/ai_input'

RSpec.describe AiInput do
  let(:object_pool) { ObjectPool.new }
  let(:input) { AiInput.new(object_pool) }
  let(:character) { Character.new(object_pool, input, 1, 1) }

  it '#control' do
    input.control(character)
    expect(input.object).to eq character
  end
end
