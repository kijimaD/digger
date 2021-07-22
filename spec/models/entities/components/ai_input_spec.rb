# frozen_string_literal: true

RSpec.describe AiInput do
  let(:object_pool) { ObjectPool.new }
  let(:input) { described_class.new(object_pool) }
  let(:character) { Character.new(object_pool, input, 2, 2) }

  before { World.new(object_pool, 'test_map.txt') }

  describe '#control' do
    it do
      input.control(character)
      expect(input.object).to eq(character)
    end
  end
end
