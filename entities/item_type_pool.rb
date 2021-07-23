# frozen_string_literal: true

# Item pool.
class ItemTypePool
  attr_reader :types

  def initialize
    @types = generate_items
  end

  def generate_items
    item_types = []
    categories = %i[consumption material]
    categories.each do |c|
      Utils.load_json("item/#{c}").each do |obj|
        item_types << ItemType.new(obj[:id], obj[:name], obj[:description], c)
      end
    end
    item_types
  end
end
