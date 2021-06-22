# Curses window class.
class GameWindow
  include Curses
  attr_reader :window

  def initialize
    init_screen
    width = 20
    @window = Window.new(5, width, (lines - 5) / 2, (cols - width) / 2)
    crmode
    setpos((lines - 5) / 2, (cols - 10) / 2)
    cbreak
    noecho
    curs_set(0)
  end
end
