# frozen_string_literal: true

RSpec.describe CharacterType do
  describe '#new_character' do
    let(:object_pool) { ObjectPool.new }

    it 'can set parameter' do
      character = Character.new(object_pool, PlayerInput.new(object_pool), 1, 1)
      expect(character.symbol).to be_truthy
    end
  end
end
