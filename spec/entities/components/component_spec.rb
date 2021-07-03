# frozen_string_literal: true

RSpec.describe Component do
  let!(:object_pool) { ObjectPool.new }

  describe 'initialize' do
    it 'can run' do
      character = Character.new(object_pool, PlayerInput.new(object_pool), 1, 1)
      expect { described_class.new(character) }
        .to change { character.components.length }.from(1).to(2)
    end
  end
end
