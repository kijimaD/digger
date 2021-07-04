# frozen_string_literal: true

# Base menu state.
class BaseMenuState < GameState
  include Singleton
  attr_accessor :field_state

  def enter; end

  def leave; end

  def draw
    $game.window.setpos(1, 1)
    $game.window.addstr('This is base menu state!')
  end

  def update; end

  def button_down(char)
    case char
    when 'm'
      GameState.switch(@field_state)
    end
  end
end
