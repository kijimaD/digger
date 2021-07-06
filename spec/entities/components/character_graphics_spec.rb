# frozen_string_literal: true

RSpec.describe CharacterGraphics do
  let(:object_pool) { ObjectPool.new }
  let(:character) { Character.new(object_pool, PlayerInput.new(object_pool), 2, 2) }

  it '#initialize' do
    game_object = GameObject.new(object_pool, 1, 1)
    character_graphics = described_class.new(game_object)
    expect(game_object.components).to eq([character_graphics])
  end

  it 'call from character' do
    character = Character.new(object_pool, PlayerInput.new(object_pool), 1, 1)
    expect(character.graphics).to be_truthy
  end
end
