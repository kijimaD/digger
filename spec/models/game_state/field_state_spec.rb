# frozen_string_literal: true

RSpec.describe FieldState do
  let(:field_state) { described_class.send(:new) }

  describe '#button_down' do
    before { field_state.character.move(2, 2) }

    it 'default' do
      expect([field_state.character.x, field_state.character.y]).to eq([2, 2])
    end

    it 'key down w' do
      expect { field_state.button_down('w') }.to change { field_state.character.y }.by(-1)
    end

    it 'key down a' do
      expect { field_state.button_down('a') }.to change { field_state.character.x }.by(-1)
    end

    it 'key down s' do
      expect { field_state.button_down('s') }.to change { field_state.character.y }.by(1)
    end

    it 'key down d' do
      expect { field_state.button_down('d') }.to change { field_state.character.x }.by(1)
    end

    it 'key down c' do
      expect { field_state.button_down('c') }.to raise_error SystemExit
    end
  end
end
