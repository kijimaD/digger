# Abstruct class.
class GameState
  include Curses
  attr_accessor :state

  DISPLAY_WIDTH = 20

  def initialize
    $game.window = Window.new(5, DISPLAY_WIDTH, (lines - 5) / 2, (cols - DISPLAY_WIDTH) / 2)
  end

  def self.switch(new_state)
    $game.state&.leave
    $game.state = new_state
    new_state.enter
  end

  def enter; end

  def leave; end

  def draw; end

  def update; end

  def needs_redraw?
    true
  end

  def button_down(char); end
end
