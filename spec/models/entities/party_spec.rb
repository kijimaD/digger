# frozen_string_literal: true

RSpec.describe Party do
  let(:party) { described_class.instance }

  describe '#initialize' do
    it 'access members' do
      expect(party.members.length).to eq(1)
    end
  end
end
