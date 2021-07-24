# frozen_string_literal: true

# MonsterType have static information for monster.
class MonsterType
  attr_accessor :id, :name, :vitality, :attack, :agility, :category

  def initialize(hash)
    @id = hash[:id]
    @name = hash[:name]
    @vitality = hash[:vitality]
    @attack = hash[:attack]
    @agility = hash[:agility]
    @category = hash[:category]
  end
end
