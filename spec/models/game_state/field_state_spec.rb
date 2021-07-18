# frozen_string_literal: true

RSpec.describe FieldState do
  let(:field_state) { described_class.send(:new) }

  before do
    $game = GameWindow.new
    GameState.switch(field_state)
  end

  describe '#switch' do
    it 'can switch to field_state' do
      expect($game.state).to eq(field_state)
    end
  end

  describe '#button_down' do
    before { field_state.character.move(2, 2) }

    it 'default' do
      expect([field_state.character.x, field_state.character.y]).to eq([2, 2])
    end

    it 'move up' do
      expect { field_state.button_down('w') }.to change { field_state.character.y }.by(-1)
    end

    it 'move left' do
      expect { field_state.button_down('a') }.to change { field_state.character.x }.by(-1)
    end

    it 'move down' do
      expect { field_state.button_down('s') }.to change { field_state.character.y }.by(1)
    end

    it 'move right' do
      expect { field_state.button_down('d') }.to change { field_state.character.x }.by(1)
    end

    it 'switch home state' do
      field_state.button_down('m')
      expect($game.state.class).to eq(HomeState)
    end

    it 'switch inventory state' do
      field_state.button_down('e')
      expect($game.state.class).to eq(InventoryState)
    end

    it 'key down c' do
      expect { field_state.button_down('c') }.to raise_error SystemExit
    end
  end
end
