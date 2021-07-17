# frozen_string_literal: true

# Set item default parameters.
class ItemType
  attr_reader :id, :name, :description, :category

  def initialize(id, name, description, category)
    @id = id
    @name = name
    @description = description
    @category = category
  end
end
