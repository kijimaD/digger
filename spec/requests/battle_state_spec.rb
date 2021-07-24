# frozen_string_literal: true

RSpec.describe BattleState do
  let(:object_pool) { ObjectPool.new }
  let(:ai_character) { Character.new(object_pool, AiInput.new(object_pool), 1, 1) }
  let(:player_character) { Character.new(object_pool, PlayerInput.new(object_pool), 2, 2) }
  let(:battle_state) { described_class.new(character) }
  let(:field_state) { FieldState.send(:new) }

  before do
    $game = GameWindow.new
    World.new(object_pool, 'test_map.txt')
  end

  describe 'encount battle' do
    context 'when player move to ai' do
      before { ai_character }

      it 'switch to battle_state' do
        player_character.physics.move_to(1, 1)
        expect($game.state.class).to eq(described_class)
      end
    end

    context 'when ai move to player' do
      before { player_character }

      it 'switch to battle_state' do
        ai_character.physics.move_to(2, 2)
        expect($game.state.class).to eq(described_class)
      end
    end
  end

  describe 'return field_state' do
    before { ai_character }

    it 'switch to field_state' do
      player_character.physics.move_to(1, 1)
      $game.state.button_down('f')
      expect($game.state.class).to eq(FieldState.instance.class)
    end

    it 'remove encountered enemy' do
      player_character.physics.move_to(1, 1)
      $game.state.button_down('f')

      object_pool.update_all
      expect(object_pool.same_point_objects(1, 1, player_character)).to eq([])
    end
  end
end
