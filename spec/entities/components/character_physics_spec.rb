# frozen_string_literal: true

RSpec.describe CharacterPhysics do
  let(:object_pool) { ObjectPool.new }
  let(:input) { PlayerInput.new(object_pool) }
  let(:character) { Character.new(object_pool, input, 1, 1) }

  before { Map.new(object_pool, 'debug_map.txt') }

  describe '#move_to' do
    it 'can move' do
      expect { character.physics.move_to(2, 2) }
        .to change { [character.x, character.y] }.from([1, 1]).to([2, 2])
    end
  end

  describe '#can_move_to?' do
    before { Character.new(object_pool, input, 1, 2) }

    it { expect(character.physics.can_move_to?(0, 0)).to be(false) }
    it { expect(character.physics.can_move_to?(1, 2)).to be(false) }
    it { expect(character.physics.can_move_to?(1, 3)).to be(true) }
  end
end
