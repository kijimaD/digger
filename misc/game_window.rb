# Curses window class.
class GameWindow
  include Curses
  attr_accessor :window, :state

  DISPLAY_WIDTH = 20

  def initialize
    init_screen
    cbreak
    stdscr.refresh
    display_settings
    @window = Window.new(5, DISPLAY_WIDTH, (lines - 5) / 2, (cols - DISPLAY_WIDTH) / 2)
  end

  def display_settings
    crmode
    setpos((lines - 5) / 2, (cols - 10) / 2)
    cbreak
    noecho
    curs_set(0)
  end

  def main_loop
    @state.draw
    @window.refresh

    loop do
      @window.clear

      @state.update
      @state.button_down(getch)
      @state.draw

      @window.refresh
    end
  end
end
