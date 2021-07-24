# frozen_string_literal: true

# Party is composed of member.
class Member < BattleActor
  attr_reader :id, :name, :max_hp, :hp, :max_sp, :sp

  def initialize(id, name)
    super()
    @id = id
    @name = name
    @max_hp = 100
    @hp = 100
    @max_sp = 50
    @sp = 50
  end
end
