# frozen_string_literal: true

RSpec.describe Camera do
  let(:object_pool) { ObjectPool.new }
  let(:map) { Map.new(object_pool, 'debug_map.txt') }
  let(:character) { Character.new(object_pool, PlayerInput.new(object_pool), 2, 2) }
  let(:camera) { Camera.new }

  describe '#target=' do
    it 'equal to character coordinates' do
      camera.target = character
      expect([camera.target.x, camera.target.y]).to eq([character.x, character.y])

      character.move(4, 4)
      expect([camera.target.x, camera.target.y]).to eq([character.x, character.y])
    end
  end

  describe '#viewport' do
    it 'can move' do
      camera.target = character
      expect(camera.viewport).to eq([0, 40, 0, 40])

      character.move(20, 20)
      expect(camera.viewport).to eq([0, 40, 0, 40])

      character.move(21, 21)
      expect(camera.viewport).to eq([1, 41, 1, 41])

      character.move(22, 22)
      expect(camera.viewport).to eq([2, 42, 2, 42])

      character.move(21, 2)
      expect(camera.viewport).to eq([1, 41, 0, 40])
    end
  end
end
