# frozen_string_literal: true

RSpec.describe HomeState do
  let(:home_state) { described_class.send(:new) }
  let(:field_state) { FieldState.send(:new) }

  before do
    $game = GameWindow.new
    GameState.switch(home_state)
  end

  describe '#switch' do
    it 'can switch to bese_menu_state' do
      expect($game.state).to eq(home_state)
    end
  end

  describe '#draw' do
    it 'can display' do
      $game.one_tern
    end
  end

  describe '#button_down' do
    it 'can switch field_state' do
      home_state.field_state = field_state
      home_state.button_down('m')
      expect($game.state.class).to eq(FieldState)
    end

    it 'can exit' do
      expect { home_state.button_down('c') }.to raise_error SystemExit
    end
  end
end
