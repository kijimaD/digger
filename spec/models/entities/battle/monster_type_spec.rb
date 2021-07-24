# frozen_string_literal: true

RSpec.describe MonsterType do
  let(:type) do
    {
      id: 'test',
      name: 'test',
      vitality: 1,
      attack: 1,
      agility: 1
    }
  end

  describe '#initialize' do
    it 'can run' do
      monster_type = described_class.new(type)
      expect(monster_type.id).to be_truthy
    end
  end
end
