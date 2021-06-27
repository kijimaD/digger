# It's in a cave. The player explores.
class FieldState < GameState
  include Singleton
  attr_reader :player

  def initialize
    super
    @map = Map.new('debug_map.txt')
    @player = Character.new
  end

  def enter; end

  def leave; end

  def draw
    $game.window.addstr(@map.text)

    # TODO: Move to each game object
    $game.window.setpos(@player.y, @player.x)
    $game.window.addstr('@')

    $game.window.setpos(0, 20)
    $game.window.addstr("(#{@player.x}, #{@player.y})")
  end

  def update; end

  def needs_redraw?
    true
  end

  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize, Metrics/CyclomaticComplexity
  def button_down(char)
    # TODO: Move to Character class
    old_x = @player.x
    old_y = @player.y

    case char
    when 'w' # up
      @player.move(@player.x, @player.y - 1)
      @player.move(old_x, old_y) unless @map.can_move_to?(@player.x, @player.y)
    when 'a' # left
      @player.move(@player.x - 1, @player.y)
      @player.move(old_x, old_y) unless @map.can_move_to?(@player.x, @player.y)
    when 's' # down
      @player.move(@player.x, @player.y + 1)
      @player.move(old_x, old_y) unless @map.can_move_to?(@player.x, @player.y)
    when 'd' # right
      @player.move(@player.x + 1, @player.y)
      @player.move(old_x, old_y) unless @map.can_move_to?(@player.x, @player.y)
    when 'c'
      exit
    end
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize, Metrics/CyclomaticComplexity
end
