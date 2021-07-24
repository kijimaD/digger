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
    @members << @member_pool.find { |m| m.id == 'ishihara' }
  end

  def generate_members
    members = []
    Utils.load_json('battle/member').each do |obj|
      members << Member.new(obj[:id], obj[:name])
    end
    members
  end
end
