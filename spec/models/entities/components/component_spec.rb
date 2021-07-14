# frozen_string_literal: true

RSpec.describe Component do
  let!(:object_pool) { ObjectPool.new }

  describe 'initialize' do
    it 'can run' do
      game_object = GameObject.new(object_pool, 1, 1)
      expect { described_class.new(game_object) }
        .to change { game_object.components.length }.from(0).to(1)
    end
  end
end
