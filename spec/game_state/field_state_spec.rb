# frozen_string_literal: true

RSpec.describe FieldState do
  before do
    $game = GameWindow.new
    GameState.switch(described_class.instance)
  end

  let(:field_state) { described_class.instance }

  describe '#button_down' do
    it 'default' do
      expect([field_state.character.x, field_state.character.y]).to eq([2, 2])
    end

    it 'key down w' do
      expect { $game.state.button_down('w') }
        .to change { [$game.state.character.x, $game.state.character.y] }.from([2, 2]).to([2, 1])
      $game.state.button_down('s')
    end

    it 'key down a' do
      expect { $game.state.button_down('a') }
        .to change { [$game.state.character.x, $game.state.character.y] }.from([2, 2]).to([1, 2])
      $game.state.button_down('d')
    end

    it 'key down s' do
      expect { $game.state.button_down('s') }
        .to change { [$game.state.character.x, $game.state.character.y] }.from([2, 2]).to([2, 3])
      $game.state.button_down('w')
    end

    it 'key down d' do
      expect { $game.state.button_down('d') }
        .to change { [$game.state.character.x, $game.state.character.y] }.from([2, 2]).to([3, 2])
      $game.state.button_down('a')
    end

    it 'key down c' do
      expect { $game.state.button_down('c') }.to raise_error SystemExit
    end
  end
end
