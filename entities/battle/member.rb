# frozen_string_literal: true

# Party is composed of member.
class Member < BattleActor
  attr_reader :id, :name

  def initialize(id, name)
    super()
    @id = id
    @name = name
  end
end
