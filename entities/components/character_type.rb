# frozen_string_literal: true

# Set character default parameters.
class CharacterType < Component
  attr_reader :symbol, :name

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
    else
      json = Utils.load_json('character.json').sample
      @symbol = json[:symbol]
      @name = json[:name]
    end
  end
end
