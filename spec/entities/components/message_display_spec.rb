# frozen_string_literal: true

RSpec.describe MessageDisplay do
  it '#initialize' do
    object_pool = ObjectPool.new
    character = Character.new(object_pool, PlayerInput.new(object_pool), 1, 1)
    hud = HUD.new(object_pool, character)
    described_class.new(hud, object_pool, character)
  end
end
