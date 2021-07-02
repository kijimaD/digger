require_relative '../../../entities/character'
require_relative '../../../entities/game_object'
require_relative '../../../entities/components/component'
require_relative '../../../entities/components/message_display'

RSpec.describe MessageDisplay do
  it '#initialize' do
    object_pool = ObjectPool.new
    character = Character.new(object_pool, PlayerInput.new(object_pool), 1, 1)
    hud = HUD.new(object_pool, character)
    MessageDisplay.new(hud, object_pool, character)
  end
end
