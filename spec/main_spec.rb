require_relative '../misc/game_window'
require_relative '../game_state/game_state'
require_relative '../game_state/field_state'
require_relative '../entities/object_pool'
require_relative '../entities/map'
require_relative '../entities/character'
require_relative '../entities/message_display'

RSpec.describe 'Simulate running main' do
  it 'Can run' do
    $game = GameWindow.new
    GameState.switch(FieldState.instance)
  end
end
