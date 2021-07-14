# frozen_string_literal: true

RSpec.describe 'Main' do
  it 'Can run' do
    $game = GameWindow.new
    GameState.switch(FieldState.instance)
  end
end
