# frozen_string_literal: true

RSpec.describe Monster do
  describe '#initialize' do
    let(:type) do
      {
        id: 'test',
        name: 'test',
        vitality: 1,
        attack: 1,
        agility: 1,
        category: 'robot'
      }
    end
    let(:monster) { described_class.new(MonsterType.new(type)) }

    describe '#initialize' do
      it 'can run' do
        expect(monster.type.id).to be_truthy
      end
    end
  end
end
