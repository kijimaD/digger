# frozen_string_literal: true

RSpec.describe Party do
  let(:party) { described_class.instance }

  describe '#initialize' do
    it 'access members' do
      expect(party.members.length).to eq(1)
    end

    it 'access monster_pool' do
      expect(party.monster_pool.length > 30).to be(true)
    end
  end
end
