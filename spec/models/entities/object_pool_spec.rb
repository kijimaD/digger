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

  describe '#nearby' do
    let(:input) { AiInput.new(object_pool) }

    it 'include nearby objects' do
      Character.new(object_pool, input, 1, 2)
      Character.new(object_pool, input, 1, 3)
      character = Character.new(object_pool, input, 1, 1)

      expect(object_pool.nearby(character, 3).length).to eq(2)
    end

    it 'exclude outer objects' do
      Character.new(object_pool, input, 2, 2)
      Character.new(object_pool, input, 2, 3)
      Character.new(object_pool, input, 8, 7)
      character = Character.new(object_pool, input, 5, 5)

      expect(object_pool.nearby(character, 3).length).to eq(0)
    end
  end

  describe '#nearby_point' do
    let(:input) { AiInput.new(object_pool) }

    it 'include nearby objects' do
      Character.new(object_pool, input, 1, 2)
      Character.new(object_pool, input, 1, 3)

      expect(object_pool.nearby_point(1, 1, 3).length).to eq(2)
    end

    it 'exclude nearby objects' do
      Character.new(object_pool, input, 2, 2)
      Character.new(object_pool, input, 2, 3)
      Character.new(object_pool, input, 8, 8)
      Character.new(object_pool, input, 8, 7)

      expect(object_pool.nearby_point(5, 5, 3).length).to eq(0)
    end
  end
end
