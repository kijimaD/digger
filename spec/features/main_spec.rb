# frozen_string_literal: true

RSpec.describe 'Main' do
  let(:field_state) { FieldState.instance }
  # let(:field_state) { FieldState.send(:new) }

  before { $game = nil }

  it 'Can run' do
    $game = GameWindow.new
    GameState.switch(field_state)
    100.times do
      field_state.execute = true
      $game.one_tern
    end
  end
end
