# frozen_string_literal: true

RSpec.describe FieldState do
  let(:field_state) { described_class.instance }

  describe '#button_down' do
    before { field_state.character.move(2, 2) }

    it 'default' do
      expect([field_state.character.x, field_state.character.y]).to eq([2, 2])
    end

    it 'key down w' do
      field_state.button_down('w')
      expect([field_state.character.x, field_state.character.y]).to eq([2, 1])
    end

    it 'key down a' do
      field_state.button_down('a')
      expect([field_state.character.x, field_state.character.y]).to eq([1, 2])
    end

    it 'key down s' do
      field_state.button_down('s')
      expect([field_state.character.x, field_state.character.y]).to eq([2, 3])
    end

    it 'key down d' do
      field_state.button_down('d')
      expect([field_state.character.x, field_state.character.y]).to eq([3, 2])
    end

    it 'key down c' do
      expect { field_state.button_down('c') }.to raise_error SystemExit
    end
  end
end
