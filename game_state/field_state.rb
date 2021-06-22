class FieldState < GameState
  include Singleton
  attr_accessor :play_state

  def initialize
    @map = Map.new
    @player = Character.new
  end

  def enter
  end

  def leave
  end

  def draw
  end

  def update
    $window.addstr(@map.map_with_player(@player))
  end

  def needs_redraw?
    true
  end

  def button_down(char)
    case char
    when 'w'
      @player.up
    when 'a'
      @player.left
    when 's'
      @player.down
    when 'd'
      @player.right
    when 'c'
      exit
    end
  end
end
