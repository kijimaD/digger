# frozen_string_literal: true

# Party is composed of member.
class Member < BattleActor
  attr_reader :type, :max_hp, :hp, :max_sp, :sp

  def initialize(type)
    super()
    @type = type
    @level = 1
    @max_hp = @type.vitality * 12 + (@level * 4)
    @hp = max_hp.dup
    @max_sp = @type.mind * 6 + (@level * 3)
    @sp = max_sp.dup
  end
end
