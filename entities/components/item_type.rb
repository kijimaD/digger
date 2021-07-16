# frozen_string_literal: true

# Set item default parameters.
class ItemType < Component
  attr_reader :name, :description

  def initialize(game_object)
    super(game_object)
    @object = object
    @object_pool = object.object_pool

    category = %w[consumption material].sample
    load_attributes(category)
  end

  def load_attributes(file)
    json = Utils.load_json(file).sample
    @name = json[:name]
    @description = json[:description]
  end
end
