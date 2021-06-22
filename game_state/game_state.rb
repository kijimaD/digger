# Abstruct class.
class GameState
  attr_accessor :state

  def self.switch(new_state)
    $game.state&.leave
    $game.state = new_state
    new_state.enter

    $game.main_loop # TMP
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
