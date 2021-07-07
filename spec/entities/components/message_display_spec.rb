# frozen_string_literal: true

RSpec.describe MessageDisplay do
  let(:object_pool) { ObjectPool.new }

  describe '#initialize' do
    it 'generate message_display' do
      character = Character.new(object_pool, PlayerInput.new(object_pool), 1, 1)
      hud = HUD.new(object_pool, character)
      expect(hud.message_display).to be_truthy
    end
  end
end
