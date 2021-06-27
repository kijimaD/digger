# It's in a cave. The player explores.
class FieldState < GameState
  include Singleton
  attr_reader :player

  def initialize
    super
    @object_pool = ObjectPool.new
    @map = Map.new(@object_pool, 'debug_map.txt')
    @player = Character.new(@object_pool)
  end

  def enter; end

  def leave; end

  def draw
    $game.window.addstr(@map.text)

    @object_pool.draw_all

    # TODO: Move to msg class
    $game.window.setpos(0, 20)
    $game.window.addstr("(#{@player.x}, #{@player.y})")
  end

  def update; end

  def needs_redraw?
    true
  end

  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize, Metrics/CyclomaticComplexity
  def button_down(char)
    # TODO: Move to Character input class
    case char
    when 'w' # up
      @player.move_to(@player.x, @player.y - 1)
    when 'a' # left
      @player.move_to(@player.x - 1, @player.y)
    when 's' # down
      @player.move_to(@player.x, @player.y + 1)
    when 'd' # right
      @player.move_to(@player.x + 1, @player.y)
    when 'c'
      exit
    end
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize, Metrics/CyclomaticComplexity
end
