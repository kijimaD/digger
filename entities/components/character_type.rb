# frozen_string_literal: true

# Set character default parameters.
class CharacterType < Component
  def initialize(game_object)
    super(game_object)
    case object.input
    when PlayerInput
      object.symbol = '@'
      object.name = 'Player'
    else
      json = Utils.load_json('character.json').sample
      object.symbol = json[:symbol]
      object.name = json[:name]
    end
  end
end
