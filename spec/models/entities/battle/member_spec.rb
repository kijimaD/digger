# frozen_string_literal: true

RSpec.describe Member do
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
  let(:member) { described_class.new(MemberType.new(type)) }

  describe '#initialize' do
    it 'can run' do
      expect { member }.not_to raise_error
    end
  end
end
