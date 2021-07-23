# frozen_string_literal: true

# Game party class. Hold information regardless of states.
class Party
  include Singleton
  attr_accessor :inventory

  def initialize
    @inventory = Inventory.new
  end
end
