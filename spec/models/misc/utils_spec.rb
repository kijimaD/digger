# frozen_string_literal: true

RSpec.describe Utils do
  describe '.media_path' do
    it 'can generate path' do
      expect(described_class.media_path('test_map.txt').include?('digger/media/test_map.txt')).to be(true)
    end
  end

  describe '.load_json' do
    it 'can access data' do
      json = described_class.load_json('world/character')
      random = json.sample
      expect(random[:symbol]).to be_truthy
    end
  end

  describe '.angle_between' do
    it 'return angle' do
      expect(described_class.angle_between(1, 1, 2, 1)).to eq(90)
    end
  end

  describe '.angle_quarter' do
    # 0, 90, 180, 270
    it { expect(described_class.angle_quarter(89)).to eq(0) }

    it { expect(described_class.angle_quarter(91)).to eq(90) }
    it { expect(described_class.angle_quarter(179)).to eq(90) }

    it { expect(described_class.angle_quarter(181)).to eq(180) }
    it { expect(described_class.angle_quarter(224)).to eq(180) }

    it { expect(described_class.angle_quarter(226)).to eq(270) }
    it { expect(described_class.angle_quarter(314)).to eq(270) }

    it { expect(described_class.angle_quarter(316)).to eq(0) }
    it { expect(described_class.angle_quarter(359)).to eq(0) }

    it { expect(described_class.angle_quarter(360)).to eq(nil) }
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

  describe '.gauge' do
    it 'return gauge string' do
      expect(described_class.gauge(100, 200)).to eq('|||||-----')
    end

    it 'return gauge string' do
      expect(described_class.gauge(33, 200)).to eq('||--------')
    end
  end
end
