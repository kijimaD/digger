# frozen_string_literal: true

# Inventory state.
class InventoryState < GameState
  include Singleton
  attr_accessor :field_state

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
    case char
    when 'a'
      @cursor_x -= 1 if @cursor_x.positive?
    when 'd'
      @cursor_x += 1 if @cursor_x < 1
    when 'e'
      GameState.switch(@field_state)
    when 'c'
      exit
    end
  end

  private

  # rubocop:disable Metrics/MethodLength
  def draw_tab
    case @cursor_x
    when 0
      $game.window.setpos(1, 20)
      $game.window.addstr('→アイテム')
      $game.window.setpos(1, 30)
      $game.window.addstr('素材')
    when 1
      $game.window.setpos(1, 20)
      $game.window.addstr('アイテム')
      $game.window.setpos(1, 30)
      $game.window.addstr('→素材')
    end
  end
  # rubocop:enable Metrics/MethodLength

  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  def draw_main
    case @cursor_x
    when 0
      Inventory.instance.items.each.with_index(1) do |item, i|
        $game.window.setpos(2 + i, 1)
        $game.window.addstr(item.type.name)
        $game.window.setpos(2 + i, 20)
        $game.window.addstr(item.type.description)
      end
    when 1
      materials = FieldState.instance.item_type_pool.types.select { |t| t.category == :material }
      materials.each.with_index(1) do |type, i|
        $game.window.setpos(2 + i, 1)
        $game.window.addstr(type.name)
        $game.window.setpos(2 + i, 20)
        $game.window.addstr(type.description)
        $game.window.setpos(2 + i, 50)
        $game.window.addstr(type.count.to_s)
      end
    end
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize
end
