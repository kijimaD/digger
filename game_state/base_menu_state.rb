# frozen_string_literal: true

# Base menu state.
class BaseMenuState < GameState
  include Singleton
  attr_accessor :field_state

  MENU = %w[休憩 アイテム 合成 装備 仲間 セーブ ロード].freeze

  def enter; end

  def leave; end

  def draw
    MENU.each.with_index(1) do |item, index|
      $game.window.setpos(index, 2)
      $game.window.addstr(item)
    end
  end

  def update; end

  def button_down(char)
    case char
    when 'm'
      GameState.switch(@field_state)
    end
  end
end
