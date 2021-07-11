# frozen_string_literal: true

RSpec.describe Character do
  let(:object_pool) { ObjectPool.new }
  let(:input) { PlayerInput.new(object_pool) }
  let(:character) { described_class.new(object_pool, input, 1, 1) }

  before { Map.new(object_pool, 'test_map.txt') }

  describe '#draw' do
    it '#draw implemented in GameObject class' do
      expect(character.method(:draw).source_location[0]).to include('game_object.rb')
    end
  end

  describe '#update' do
    it '#update implemented in GameObject class' do
      expect(character.method(:update).source_location[0]).to include('game_object.rb')
    end
  end
end
