# frozen_string_literal: true

RSpec.describe InventoryState do
  before { $game = GameWindow.new }

  describe 'switch' do
    it 'can switch to inventory_state' do
      GameState.switch(described_class.instance)
      expect($game.state).to eq(described_class.instance)
    end
  end
end
