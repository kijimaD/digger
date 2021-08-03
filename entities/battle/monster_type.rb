# frozen_string_literal: true

# MonsterType have static information for monster.
class MonsterType
  attr_accessor :id, :name, :vitality, :attack, :agility, :category, :image

  def initialize(hash)
    @id = hash[:id]
    @name = hash[:name]
    @vitality = hash[:vitality]
    @attack = hash[:attack]
    @agility = hash[:agility]
    @category = hash[:category]
    @image = File.read(Utils.media_path("aa/#{@category}.txt"))
  end
end
