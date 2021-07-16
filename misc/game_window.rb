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
  end

  def display_settings
    crmode
    cbreak
    noecho
    curs_set(0)
  end

  def main_loop
    one_tern

    loop do
      one_tern
    end
  end

  def one_tern
    @window = Window.new(lines - 1, cols - 1, PADDING, PADDING) # For variable window. It has performance problem?
    @window.clear

    @state.update
    @state.draw

    @window.box('|', '-', '*')
    @window.refresh
    @state.button_down(getch) unless $test
  end
end
