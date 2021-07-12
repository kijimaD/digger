# frozen_string_literal: true

# Inventory.
class Inventory
  include Singleton
  attr_accessor :items

  def initialize
    @items = []
  end

  def add(item)
    @items << item
  end
end
