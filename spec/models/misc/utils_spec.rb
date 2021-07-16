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
end
