# frozen_string_literal: true

# Game party class. Hold information regardless of states.
class Party
  include Singleton
  attr_accessor :inventory
  attr_reader :members, :member_pool, :monster_pool

  def initialize
    @inventory = Inventory.new
    @member_pool = generate_members
    @members = []
    @members << @member_pool.find { |m| m.type.id == 'ishihara' }

    @monster_pool = generate_monsters
  end

  def generate_members
    members = []
    Utils.load_json('battle/member').each do |obj|
      type = MemberType.new(obj)
      members << Member.new(type)
    end
    members
  end

  def generate_monsters
    monsters = []
    categories = %w[artillery beast dragon human insect robot slime sub_human tank ufo]
    categories.each do |category|
      Utils.load_json("battle/#{category}").each do |obj|
        obj[:category] = category
        type = MonsterType.new(obj)
        monsters << Monster.new(type)
      end
    end
    monsters
  end
end
