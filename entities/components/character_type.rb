# frozen_string_literal: true

# Set character default parameters.
class CharacterType < Component
  attr_reader :symbol, :name

  def initialize(game_object)
    super(game_object)
    @object = object
    @object_pool = object.object_pool

    set_parameter
  end

  def set_parameter
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
