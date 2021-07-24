# frozen_string_literal: true

RSpec.describe MemberType do
  let(:type) do
    {
      id: 'test',
      name: 'test',
      vitality: 1,
      strength: 1,
      dexterity: 1,
      agility: 1,
      mind: 1
    }
  end

  describe '#initialize' do
    it 'can access' do
      member_type = described_class.new(type)
      expect(member_type.id).to be_truthy
    end
  end
end
