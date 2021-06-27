require_relative '../../entities/character'
require_relative '../../entities/game_object'
require_relative '../../entities/message_display'

RSpec.describe MessageDisplay do
  it '#add' do
    object_pool = ObjectPool.new
    character = Character.new(object_pool)
    message_display = MessageDisplay.new(object_pool, character)

    expect(message_display.messages.length).to eq(0)
    message_display.add('test')
    expect(message_display.messages.length).to eq(1)
  end

  it '#latest_messages' do
    object_pool = ObjectPool.new
    character = Character.new(object_pool)
    message_display = MessageDisplay.new(object_pool, character)

    10.times { message_display.add('test') }
    expect(message_display.messages.length).to eq(10)
    message_display.add('test')
    expect(message_display.messages.length).to eq(11)
    message_display.latest_messages
    expect(message_display.messages.length).to eq(10)
  end
end
