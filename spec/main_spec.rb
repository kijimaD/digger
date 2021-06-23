require_relative '../misc/game_window'
require_relative '../game_state/game_state'
require_relative '../game_state/field_state'

RSpec.describe 'Simulate main' do
  it 'Can run' do
    GameWindow.new
    GameState.switch(FieldState.instance)
  end
end
