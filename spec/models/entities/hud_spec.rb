# frozen_string_literal: true

RSpec.describe HUD do
  it '#initialize' do
    object_pool = ObjectPool.new
    character = Character.new(object_pool, PlayerInput.new(object_pool), 1, 1)
    expect { described_class.new(object_pool, character) }.not_to raise_error
  end
end
