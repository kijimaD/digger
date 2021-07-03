# frozen_string_literal: true

RSpec.describe Utils do
  it '.media_path' do
    expect(described_class.media_path('debug_map.txt').include?('digger/media/debug_map.txt')).to be(true)
  end
end
