# frozen_string_literal: true

RSpec.describe InventoryState do
  let(:object_pool) { ObjectPool.new }
  let(:inventory_state) { described_class.send(:new) }
  let(:item_type) { ItemType.new('portion', '回復薬', '回復する', :consumption) }
  let(:item) { Item.new(object_pool, 2, 2, item_type) }

  before do
    $game = GameWindow.new
    GameState.switch(inventory_state)
  end

  describe '#switch' do
    it 'can switch to inventory_state' do
      expect($game.state).to eq(inventory_state)
    end
  end

  describe '#draw_tab' do
    it 'can display the item tab(consumption)' do
      Inventory.instance.add(item)
      $game.one_turn
    end

    it 'can display other tabs' do
      4.times do
        inventory_state.button_down('d')
        $game.one_turn
      end
    end
  end
end
