# frozen_string_literal: true

# Inventory state.
class InventoryState < GameState
  include Singleton
  attr_accessor :field_state

  def enter; end

  def leave; end

  # rubocop:disable Metrics/AbcSize
  def draw
    $game.window.setpos(1, 1)
    $game.window.addstr('Inventory')

    Inventory.instance.items.each.with_index(1) do |item, i|
      $game.window.setpos(1 + i, 1)
      $game.window.addstr(item.type.name)
      $game.window.setpos(1 + i, 20)
      $game.window.addstr(item.type.description)
    end
  end
  # rubocop:enable Metrics/AbcSize

  def update; end

  def button_down(char)
    case char
    when 'e'
      GameState.switch(@field_state)
    when 'c'
      exit
    end
  end
end
