# frozen_string_literal: true

# Game party class. Hold information regardless of states.
class Party
  include Singleton
  attr_accessor :inventory
  attr_reader :members

  def initialize
    @inventory = Inventory.new
    @member_pool = generate_members
    @members = []
    @members << @member_pool.find { |m| m.type.id == 'ishihara' }
  end

  def generate_members
    members = []
    Utils.load_json('battle/member').each do |obj|
      type = MemberType.new(obj)
      members << Member.new(type)
    end
    members
  end
end
