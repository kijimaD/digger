# frozen_string_literal: true

RSpec.describe CharacterPhysics do
  let(:object_pool) { ObjectPool.new }

  before { World.new(object_pool, 'debug_map.txt') }

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
        Item.new(object_pool, 2, 2)
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
        Item.new(object_pool, 2, 2)
      end

      it { expect(character.physics.can_move_to?(0, 0)).to be(false) } # terrain
      it { expect(character.physics.can_move_to?(1, 2)).to be(false) } # character
      it { expect(character.physics.can_move_to?(2, 2)).to be(true) } # item
      it { expect(character.physics.can_move_to?(1, 3)).to be(true) }
    end
  end
end
