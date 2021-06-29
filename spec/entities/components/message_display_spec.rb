require_relative '../../../entities/character'
require_relative '../../../entities/game_object'
require_relative '../../../entities/components/component'
require_relative '../../../entities/components/message_display'

RSpec.describe MessageDisplay do
  it '#add' do
    object_pool = ObjectPool.new
    character = Character.new(object_pool, PlayerInput.new(object_pool), 1, 1)
    hud = HUD.new(object_pool, character)
    message_display = MessageDisplay.new(hud, object_pool, character)

    expect(message_display.messages.length).to eq(0)
    message_display.add('test')
    expect(message_display.messages.length).to eq(1)
  end

  it '#latest_messages' do
    object_pool = ObjectPool.new
    character = Character.new(object_pool, PlayerInput.new(object_pool), 1, 1)
    hud = HUD.new(object_pool, character)
    message_display = MessageDisplay.new(hud, object_pool, character)

    10.times { message_display.add('test') }
    expect(message_display.messages.length).to eq(10)
    message_display.add('test')
    expect(message_display.messages.length).to eq(11)
    message_display.update
    expect(message_display.messages.length).to eq(10)
  end
end
