# frozen_string_literal: true

RSpec.describe AiInput do
  let(:object_pool) { ObjectPool.new }
  let(:input) { described_class.new(object_pool) }
  let(:character) { Character.new(object_pool, input, 1, 1) }

  before { Map.new(object_pool, 'test_map.txt') }

  describe '#control' do
    it do
      input.control(character)
      expect(input.object).to eq(character)
    end
  end

  describe '#random_move' do
    context 'when player move' do
      before do
        player = Character.new(object_pool, PlayerInput.new(object_pool), 1, 1)
        player.physics.move_to(2, 2)
      end

      it 'AI character move' do
        character.input.random_move
        expect([character.x, character.y]).not_to eq([2, 2])
      end
    end

    context 'when player not move' do
      before do
        player = Character.new(object_pool, PlayerInput.new(object_pool), 1, 1)
        player.physics.move_to(1, 1)
      end

      it 'AI character not move' do
        character.input.random_move
        expect([character.x, character.y]).to eq([1, 1])
      end
    end
  end
end
