RSpec.describe Utils do
  it '.media_path' do
    expect(Utils.media_path('debug_map.txt').include?('digger/media/debug_map.txt')).to be(true)
  end
end
