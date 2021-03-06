# frozen_string_literal: true

# Inventory.
class Inventory
  attr_accessor :items

  def initialize
    @items = []
  end

  def add(item)
    case item.type.category
    when :consumption
      @items << item
    when :material
      item.type.count += 1
    end
  end
end
