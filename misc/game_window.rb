# frozen_string_literal: true

# Curses window class.
class GameWindow
  include Curses
  attr_accessor :window, :state

  HEIGHT = 40
  WIDTH = 40
  PADDING = 1

  def initialize
    init_screen
    cbreak
    stdscr.refresh
    display_settings
    @window = Window.new(lines - 1, cols - 1, PADDING, PADDING)
  end

  def display_settings
    crmode
    cbreak
    noecho
    curs_set(0)
  end

  # rubocop: disable Metrics/MethodLength
  def main_loop
    @state.draw
    @window.box('|', '-', '*')
    @window.refresh

    loop do
      @window.clear
      @window.box('|', '-', '*')
      @state.update
      @state.button_down(getch)
      @state.draw

      @window.refresh
    end
  end
  # rubocop: enable Metrics/MethodLength
end
