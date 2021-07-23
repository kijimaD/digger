# frozen_string_literal: true

RSpec.describe BattleState do
  let(:object_pool) { ObjectPool.new }
  let(:battle_state) { described_class.send(:new) }

  before do
    $game = GameWindow.new
    GameState.switch(battle_state)
  end

  describe '#switch' do
    it 'can switch to battle_state' do
      expect($game.state).to eq(battle_state)
    end
  end
end
