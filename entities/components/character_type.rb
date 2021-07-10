# frozen_string_literal: true

# Set character default parameters.
class CharacterType < Component
  def new_character
    json = Utils.load_json('character.json').sample
    object.symbol = json['symbol']
    object.name = json['name']
    self
  end
end
