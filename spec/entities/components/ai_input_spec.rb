# frozen_string_literal: true

RSpec.describe AiInput do
  let(:object_pool) { ObjectPool.new }
  let(:input) { described_class.new(object_pool) }
  let(:character) { Character.new(object_pool, input, 1, 1) }

  before { World.new(object_pool, 'test_map.txt') }

  describe '#control' do
    it do
      input.control(character)
      expect(input.object).to eq(character)
    end
  end

  describe '#random_move' do
    context 'when execute true' do
      before do
        FieldState.instance.execute = true
      end

      it 'AI character move' do
        character.input.random_move
        expect([character.x, character.y]).not_to eq([2, 2])
      end
    end

    context 'when execute false' do
      before do
        FieldState.instance.execute = false
      end

      it 'AI character not move' do
        character.input.random_move
        expect([character.x, character.y]).to eq([1, 1])
      end
    end
  end
end
