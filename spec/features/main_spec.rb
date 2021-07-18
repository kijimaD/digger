# frozen_string_literal: true

RSpec.describe 'Main' do
  let(:field_state) { FieldState.send(:new) }

  before { $game = GameWindow.new }

  it 'Can run' do
    GameState.switch(field_state)
    100.times do
      field_state.execute = true
      $game.one_turn
    end
  end
end
