# frozen_string_literal: true

RSpec.describe Utils do
  describe '.media_path' do
    it 'can generate path' do
      expect(described_class.media_path('test_map.txt').include?('digger/media/test_map.txt')).to be(true)
    end
  end

  describe '.load_json' do
    it 'can access data' do
      json = described_class.load_json('character')
      random = json.sample
      expect(random[:symbol]).to be_truthy
    end
  end

  describe '.angle_between' do
    it 'return angle' do
      expect(described_class.angle_between(1, 1, 2, 1)).to eq(90)
    end
  end

  describe '.distance_between' do
    it 'return distance' do
      expect(described_class.distance_between(4, 5, 4, 4)).to eq(1)
    end
  end

  describe '.point_at_distance' do
    it 'return coordinate' do
      expect(described_class.point_at_distance(1, 1, 90, 1)).to eq([2, 1])
    end
  end
end
