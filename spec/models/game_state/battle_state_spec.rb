# frozen_string_literal: true

RSpec.describe BattleState do
  let(:object_pool) { ObjectPool.new }
  let(:character) { Character.new(object_pool, AiInput.new(object_pool), 2, 2) }
  let(:battle_state) { described_class.new(character) }

  before do
    $game = GameWindow.new
    GameState.switch(battle_state)
  end

  describe '#switch' do
    it 'can switch to battle_state' do
      expect($game.state).to eq(battle_state)
    end
  end

  describe '#draw' do
    it 'can display' do
      $game.one_turn
    end
  end

  describe '#generate_monster' do
    context 'when exist category'
    it 'return enemy object array' do
      expect(battle_state.generate_monsters('tank').first).to be_truthy
    end

    context 'when not exist category'
    it 'return nil array' do
      expect(battle_state.generate_monsters('not_exist').first).to be_falsey
    end
  end
end
