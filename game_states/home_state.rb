# frozen_string_literal: true

# Home menu state.
class HomeState < GameState
  include Singleton
  attr_accessor :field_state

  MENU = %w[休憩[b] アイテム[i] 合成[a] 装備[e] 仲間[t] セーブ[s] ロード[l]].freeze

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
    super(char)

    case char
    when 'm'
      return unless $debug

      GameState.switch(@field_state)
    end
  end
end
