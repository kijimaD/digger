# It's in a cave. The player explores.
class FieldState < GameState
  include Singleton
  attr_reader :player

  def initialize
    super
    @object_pool = ObjectPool.new
    @map = Map.new(@object_pool, 'debug_map.txt')
    @player = Character.new(@object_pool)
    @message_display = MessageDisplay.new(@object_pool, @player)
  end

  def enter; end

  def leave; end

  def draw
    @map.draw
    @object_pool.draw_all
  end

  def update
    @message_display.update
  end

  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  def button_down(char)
    # TODO: Move to Character input class
    case char
    when 'w'
      @player.move_to(@player.x, @player.y - 1) # up
      @object_pool.message.add('Move up')
    when 'a'
      @player.move_to(@player.x - 1, @player.y) # left
      @object_pool.message.add('Move left')
    when 's'
      @player.move_to(@player.x, @player.y + 1) # down
      @object_pool.message.add('Move down')
    when 'd'
      @player.move_to(@player.x + 1, @player.y) # right
      @object_pool.message.add('Move right')
    when 'c'
      exit
    end
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize
end
