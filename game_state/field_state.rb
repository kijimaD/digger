# frozen_string_literal: true

# It's in a cave. The player explores.
class FieldState < GameState
  include Singleton
  attr_accessor :execute
  attr_reader :character

  def initialize
    super
    @object_pool = ObjectPool.new
    @map = Map.new(@object_pool, 'debug_map.txt')
    @character = Character.new(@object_pool, PlayerInput.new(@object_pool), 2, 2)
    @hud = HUD.new(@object_pool, @character)
    @camera = Camera.new
    @camera.target = @character
    @object_pool.camera = @camera
    generate_game_objects
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
    when 'm'
      return unless $debug

      home = HomeState.instance
      home.field_state = self
      GameState.switch(home)
    end
  end

  private

  def generate_game_objects
    @map.spawn_points(10).each do
      x, y = @map.spawn_point
      Item.new(@object_pool, x, y)
    end

    @map.spawn_points(10).each do
      x, y = @map.spawn_point
      Character.new(@object_pool, AiInput.new(@object_pool), x, y)
    end
  end
end
