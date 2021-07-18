# frozen_string_literal: true

RSpec.describe PlayerInput do
  let(:object_pool) { ObjectPool.new }
  let(:input) { described_class.new(object_pool) }
  let(:character) { Character.new(object_pool, input, 1, 1) }

  it '#control' do
    input.control(character)
    expect(input.object).to eq character
  end
end
