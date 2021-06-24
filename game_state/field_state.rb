# It's in a cave. The player explores.
class FieldState < GameState
  include Singleton
  attr_reader :player

  def initialize
    super
    @map = Map.new
    @player = Character.new
  end

  def enter; end

  def leave; end

  def draw
    $game.window.addstr(@map.map_with_player(@player))
  end

  def update; end

  def needs_redraw?
    true
  end

  # rubocop:disable Metrics/MethodLength
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
  # rubocop:enable Metrics/MethodLength
end
