require_relative '../../game_state/game_state'
require_relative '../../game_state/field_state'

RSpec.describe FieldState do
  it '#button_down' do
    $game = GameWindow.new
    GameState.switch(FieldState.instance)

    expect($game.state.player.x).to eq(1)
    expect($game.state.player.y).to eq(1)

    $game.state.button_down('w')
    $game.state.button_down('a')

    expect($game.state.player.x).to eq(0)
    expect($game.state.player.y).to eq(0)

    $game.state.button_down('s')
    $game.state.button_down('d')

    expect($game.state.player.x).to eq(1)
    expect($game.state.player.y).to eq(1)
  end
end
