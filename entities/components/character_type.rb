# frozen_string_literal: true

# Set character default parameters.
class CharacterType < Component
  attr_reader :id, :name, :symbol

  def initialize(game_object)
    super(game_object)
    @object = object
    @object_pool = object.object_pool

    load_attributes
  end

  def load_attributes
    case @object.input
    when PlayerInput
      @symbol = '@'
      @name = 'Player'
    when AiInput
      json = Utils.load_json('world/character').sample
      @id = json[:id]
      @name = json[:name]
      @symbol = json[:symbol]
    end
  end
end
