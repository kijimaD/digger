# Curses window class.
class GameWindow
  include Curses
  attr_accessor :window, :state

  DISPLAY_WIDTH = 20

  def initialize
    init_screen
    display_settings
  end

  def display_settings
    crmode
    setpos((lines - 5) / 2, (cols - 10) / 2)
    cbreak
    noecho
    curs_set(0)
  end

  def main_loop
    loop do
      @window.clear

      @state.draw
      @state.button_down(getch)
      @state.update

      @window.refresh
    end
  end
end
