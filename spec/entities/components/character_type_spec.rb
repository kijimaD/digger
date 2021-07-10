# frozen_string_literal: true

RSpec.describe CharacterType do
  describe '#new_character' do
    let(:object_pool) { ObjectPool.new }

    it 'set symbol @ to player character' do
      character = Character.new(object_pool, PlayerInput.new(object_pool), 1, 1)
      expect(character.symbol).to eq('@')
    end

    it 'set symbol to AI character' do
      character = Character.new(object_pool, AiInput.new(object_pool), 1, 1)
      expect(character.symbol).to be_truthy
    end
  end
end
