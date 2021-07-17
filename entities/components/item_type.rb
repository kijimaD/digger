# frozen_string_literal: true

# Set item default parameters.
class ItemType
  attr_reader :id, :name, :description, :category
  attr_accessor :count

  def initialize(id, name, description, category)
    @id = id
    @name = name
    @description = description
    @category = category
    @count = 0
  end
end
