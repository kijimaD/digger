# frozen_string_literal: true

# Party is composed of member.
class Monster < BattleActor
  attr_reader :type, :max_hp, :hp

  def initialize(type)
    super()
    @type = type
    @level = 1
    @max_hp = @type.vitality * 12 + (@level * 4)
    @hp = max_hp
  end

  def attack(num)
    @hp -= num
  end
end
