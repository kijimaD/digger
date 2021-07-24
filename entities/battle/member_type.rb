# frozen_string_literal: true

# MemberType have static information for member.
class MemberType
  attr_accessor :id, :name, :vitality, :strength, :dexterity, :agility, :mind

  def initialize(hash)
    @id = hash[:id]
    @name = hash[:name]
    @vitality = hash[:vitality]
    @strength = hash[:strength]
    @dexterity = hash[:dexterity]
    @agility = hash[:agility]
    @mind = hash[:mind]
  end
end
