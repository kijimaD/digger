# It's in a cave. The player explores.
class FieldState < GameState
  include Singleton
  attr_reader :character

  def initialize
    super
    @object_pool = ObjectPool.new
    @map = Map.new(@object_pool, 'debug_map.txt')
    @character = Character.new(@object_pool, PlayerInput.new(@object_pool), 1, 1)
    Character.new(@object_pool, AiInput.new(@object_pool), 14, 7) # enemy
    @hud = HUD.new(@object_pool, @character)
  end

  def enter; end

  def leave; end

  def draw
    @map.draw
    @hud.draw
    @object_pool.draw_all
  end

  def update
    @hud.update
    @object_pool.update_all
  end

  def button_down(char)
    @character.input.button_down(char)
  end
end
