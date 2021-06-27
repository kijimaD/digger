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

  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  def button_down(char)
    # TODO: Move to Character input class
    case char
    when 'w'
      @player.move_to(@player.x, @player.y - 1) # up
    when 'a'
      @player.move_to(@player.x - 1, @player.y) # left
    when 's'
      @player.move_to(@player.x, @player.y + 1) # down
    when 'd'
      @player.move_to(@player.x + 1, @player.y) # right
    when 'c'
      exit
    end
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize
end
