# frozen_string_literal: true

# It's in a cave. The player explores.
class FieldState < GameState
  include Singleton
  attr_reader :character

  def initialize
    super
    @object_pool = ObjectPool.new
    @map = Map.new(@object_pool, 'debug_map.txt')
    @character = Character.new(@object_pool, PlayerInput.new(@object_pool), 2, 2)
    Character.new(@object_pool, AiInput.new(@object_pool), 14, 7) # enemy
    @hud = HUD.new(@object_pool, @character)
    @camera = Camera.new
    @camera.target = @character # tmp
    @object_pool.camera = @camera
  end

  def enter; end

  def leave; end

  def draw
    @object_pool.draw_all
    viewport = @camera.viewport
    @map.draw(viewport)
    @hud.draw
  end

  def update
    @object_pool.update_all
    @map.update
    @hud.update
  end

  def button_down(char)
    @character.input.button_down(char)
    case char
    when 'm' # TODO: debug mode only
      home = HomeState.instance
      home.field_state = self
      GameState.switch(home)
    end
  end
end
