# frozen_string_literal: true

RSpec.describe ObjectPool do
  let!(:object_pool) { described_class.new }

  describe '#size' do
    it 'can count objects' do
      expect { Character.new(object_pool, PlayerInput.new(object_pool), 1, 1) }
        .to change(object_pool, :size).from(0).to(1)
    end
  end

  describe '#add' do
    it 'can add' do
      obj = Object.new

      object_pool.add(obj)
      expect(object_pool.objects).to eq([obj])
    end
  end

  describe '#update_all' do
    it 'call update' do
      game_object_mock = double
      allow(game_object_mock).to receive(:update)
      allow(game_object_mock).to receive(:removable?)

      object_pool.add(game_object_mock)
      object_pool.update_all
      expect(game_object_mock).to have_received(:update).once
    end

    it 'remove flag objects' do
      game_object = GameObject.new(object_pool, 1, 1)
      game_object.mark_for_removal
      expect { object_pool.update_all }.to change(object_pool.objects, :count).from(1).to(0)
    end
  end

  describe '#draw_all' do
    it 'call draw' do
      game_object_mock = double
      allow(game_object_mock).to receive(:draw)

      object_pool.add(game_object_mock)
      object_pool.draw_all
      expect(game_object_mock).to have_received(:draw).once
    end
  end

  describe '#same_point_objects' do
    let(:input) { AiInput.new(object_pool) }

    context 'when not exist same coordinate' do
      it 'return []' do
        Character.new(object_pool, input, 2, 2)
        expect(object_pool.same_point_objects(1, 1)).to eq([])
      end

      it 'not include self game_object' do
        character = Character.new(object_pool, input, 1, 1)
        expect(object_pool.same_point_objects(character.x, character.y, character)).to eq([])
      end
    end

    context 'when exist same coordinate' do
      it 'return same coordinate game_object' do
        character = Character.new(object_pool, input, 1, 1)
        expect(object_pool.same_point_objects(1, 1)).to eq([character])
      end
    end
  end
end
