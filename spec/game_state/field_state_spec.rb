RSpec.describe FieldState do
  it '#button_down' do
    $game = GameWindow.new
    GameState.switch(FieldState.instance)

    expect($game.state.character.x).to eq(1)
    expect($game.state.character.y).to eq(1)

    $game.state.button_down('s')
    $game.state.button_down('d')

    expect($game.state.character.x).to eq(2)
    expect($game.state.character.y).to eq(2)

    $game.state.button_down('w')
    $game.state.button_down('a')

    expect($game.state.character.x).to eq(1)
    expect($game.state.character.y).to eq(1)

    expect { $game.state.button_down('c') }.to raise_error SystemExit
  end
end
