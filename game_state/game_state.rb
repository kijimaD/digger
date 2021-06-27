# Abstruct class.
class GameState
  def self.switch(new_state)
    $game.state&.leave
    $game.state = new_state
    new_state.enter
  end

  def enter; end

  def leave; end

  def draw; end

  def update; end

  def button_down(char); end
end
