# frozen_string_literal: true

RSpec.describe CharacterPhysics do
  let(:object_pool) { ObjectPool.new }
  let(:item_type) { ItemType.new('portion', '回復薬', '回復する', :consumption) }

  before { World.new(object_pool, 'test_map.txt') }

  describe '#turn_right' do
    let(:input) { PlayerInput.new(object_pool) }
    let(:character) { Character.new(object_pool, input, 1, 1) }

    it 'can turn' do
      before_direction = character.physics.direction
      character.physics.turn_right
      expect(character.physics.direction).not_to eq(before_direction)
    end

    it 'go around, same direction' do
      before_direction = character.physics.direction
      4.times { character.physics.turn_right }
      expect(character.physics.direction).to eq(before_direction)
    end
  end

  describe '#turn_left' do
    let(:input) { PlayerInput.new(object_pool) }
    let(:character) { Character.new(object_pool, input, 1, 1) }

    it 'can turn' do
      before_direction = character.physics.direction
      character.physics.turn_left
      expect(character.physics.direction).not_to eq(before_direction)
    end

    it 'go around, same direction' do
      before_direction = character.physics.direction
      4.times { character.physics.turn_left }
      expect(character.physics.direction).to eq(before_direction)
    end
  end

  describe '#move_to' do
    let(:input) { PlayerInput.new(object_pool) }
    let(:character) { Character.new(object_pool, input, 1, 1) }

    it 'can move' do
      expect { character.physics.move_to(2, 2) }
        .to change { [character.x, character.y] }.from([1, 1]).to([2, 2])
    end
  end

  describe '#can_move_to?' do
    context 'when player input character' do
      let(:input) { PlayerInput.new(object_pool) }
      let(:character) { Character.new(object_pool, input, 1, 1) }

      before do
        Character.new(object_pool, input, 1, 2)
        Item.new(object_pool, 2, 2, item_type)
      end

      it { expect(character.physics.can_move_to?(0, 0)).to be(false) } # terrain
      it { expect(character.physics.can_move_to?(1, 2)).to be(false) } # character
      it { expect(character.physics.can_move_to?(2, 2)).to be(true) } # item
      it { expect(character.physics.can_move_to?(1, 3)).to be(true) }
    end

    context 'when AI input character' do
      let(:input) { AiInput.new(object_pool) }
      let(:character) { Character.new(object_pool, input, 1, 1) }

      before do
        Character.new(object_pool, input, 1, 2)
        Item.new(object_pool, 2, 2, item_type)
      end

      it { expect(character.physics.can_move_to?(0, 0)).to be(false) } # terrain
      it { expect(character.physics.can_move_to?(1, 2)).to be(false) } # character
      it { expect(character.physics.can_move_to?(2, 2)).to be(true) } # item
      it { expect(character.physics.can_move_to?(1, 3)).to be(true) }
    end
  end
end
