# frozen_string_literal: true

RSpec.describe Camera do
  let(:object_pool) { ObjectPool.new }
  let(:map) { Map.new(object_pool, 'debug_map.txt') }
  let(:character) { Character.new(object_pool, PlayerInput.new(object_pool), 2, 2) }
  let(:camera) { described_class.new }

  describe '#target=' do
    context 'when initialize' do
      it 'equal to character coordinates' do
        camera.target = character
        expect([camera.target.x, camera.target.y]).to eq([character.x, character.y])
      end
    end

    context 'when move' do
      it 'equal to character coordinates' do
        camera.target = character
        character.move(4, 4)
        expect([camera.target.x, camera.target.y]).to eq([character.x, character.y])
      end
    end
  end

  describe '#viewport' do
    before { camera.target = character }

    it "camera dont't move" do
      character.move(1, 1)
      expect(camera.viewport).to eq([0, 40, 0, 40])
    end

    it "camera still dont't move" do
      character.move(20, 20)
      expect(camera.viewport).to eq([0, 40, 0, 40])
    end

    it 'start moving camera' do
      character.move(21, 21)
      expect(camera.viewport).to eq([1, 41, 1, 41])
    end

    it 'move camera' do
      character.move(22, 22)
      expect(camera.viewport).to eq([2, 42, 2, 42])
    end

    it 'move x direction only' do
      character.move(21, 2)
      expect(camera.viewport).to eq([1, 41, 0, 40])
    end
  end
end
