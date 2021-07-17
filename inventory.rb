# frozen_string_literal: true

# Inventory.
class Inventory
  include Singleton
  attr_accessor :items

  def initialize
    @items = []
  end

  def add(item)
    case item.type.category
    when :consumption
      @items << item
    when :material
      nil
    end
  end
end
