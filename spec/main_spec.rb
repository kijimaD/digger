# frozen_string_literal: true

RSpec.describe 'Simulate running main' do
  it 'Can run' do
    $game = GameWindow.new
    GameState.switch(FieldState.instance)
  end
end
