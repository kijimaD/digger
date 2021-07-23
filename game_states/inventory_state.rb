# frozen_string_literal: true

# Inventory state.
class InventoryState < GameState
  include Singleton
  attr_accessor :field_state

  TABS = %w[アイテム 武器 装飾 素材 キー].freeze

  def initialize
    super
    @cursor_x = 0
  end

  def enter; end

  def leave; end

  def draw
    $game.window.setpos(1, 1)
    $game.window.addstr('Inventory')

    draw_tab
    draw_main
  end

  def update; end

  def button_down(char)
    super(char)

    case char
    when 'a'
      @cursor_x -= 1 if @cursor_x.positive?
    when 'd'
      @cursor_x += 1 if @cursor_x < 4
    when 'e'
      GameState.switch(@field_state)
    end
  end

  private

  def draw_tab
    TABS.each.with_index(0) do |tab, i|
      $game.window.setpos(2, 20 + 10 * i)
      $game.window.addstr(tab)
    end

    $game.window.setpos(1, 20 + @cursor_x * 10)
    $game.window.addstr('▼')
  end

  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  def draw_main
    case @cursor_x
    when 0
      Party.instance.inventory.items.each.with_index(0) do |item, i|
        $game.window.setpos(4 + i, 1)
        $game.window.addstr(item.type.name)
        $game.window.setpos(4 + i, 20)
        $game.window.addstr(item.type.description)
      end
    when 3
      materials = FieldState.instance.item_type_pool.types.select { |t| t.category == :material }
      materials.each.with_index(0) do |type, i|
        $game.window.setpos(4 + i, 1)
        $game.window.addstr(type.name)
        $game.window.setpos(4 + i, 20)
        $game.window.addstr(type.description)
        $game.window.setpos(4 + i, 50)
        $game.window.addstr("x#{type.count}")
      end
    end
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize
end
