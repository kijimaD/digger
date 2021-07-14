# frozen_string_literal: true

RSpec.describe 'Main' do
  let(:field_state) { FieldState.send(:new) }

  it 'Can run' do
    $game = GameWindow.new
    GameState.switch(field_state)
  end
end
