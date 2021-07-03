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

      object_pool.add(game_object_mock)
      object_pool.update_all
      expect(game_object_mock).to have_received(:update).once
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

  describe '#same_point' do
    let(:input) { AiInput.new(object_pool) }
    let(:character) { Character.new(object_pool, input, 1, 1) }

    context 'when not exist same coordinate' do
      before { Character.new(object_pool, input, 1, 2) }

      it { expect(object_pool.same_point_objects(character).count).to eq(0) }
    end

    context 'when exist same coordinate' do
      before { Character.new(object_pool, input, 1, 1) }

      it { expect(object_pool.same_point_objects(character).count).to eq(1) }
    end
  end
end
