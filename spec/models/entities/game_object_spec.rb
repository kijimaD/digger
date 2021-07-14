# frozen_string_literal: true

RSpec.describe GameObject do
  let(:object_pool) { ObjectPool.new }

  describe '#components' do
    it 'can add components' do
      game_object = described_class.new(object_pool, 1, 1)
      Component.new(game_object)

      expect(game_object.components.length).to eq(1)
    end
  end
end
