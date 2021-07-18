# frozen_string_literal: true

# It's in a cave. The player explores.
class FieldState < GameState
  include Singleton
  attr_accessor :execute
  attr_reader :character, :item_type_pool

  def initialize
    super
    @object_pool = ObjectPool.new
    @world = World.new(@object_pool, 'debug_map.txt')
    @character = Character.new(@object_pool, PlayerInput.new(@object_pool), 2, 2)
    @hud = HUD.new(@object_pool, @character)
    @camera = Camera.new
    @camera.target = @character
    @object_pool.camera = @camera

    @item_type_pool = ItemTypePool.new
    generate_game_objects
  end

  def enter; end

  def leave; end

  def draw
    @object_pool.draw_all
    viewport = @camera.viewport
    @world.draw(viewport)
    @hud.draw
  end

  def update
    @object_pool.update_all
    @world.update
    @hud.update
  end

  # rubocop:disable Metrics/MethodLength
  def button_down(char)
    @character.input.button_down(char)
    case char
    when 'm'
      return unless $debug

      home = HomeState.instance
      home.field_state = self
      GameState.switch(home)
    when 'e'
      inventory = InventoryState.instance
      inventory.field_state = self
      GameState.switch(inventory)
    when 'c'
      exit
    end
  end
  # rubocop:enable Metrics/MethodLength

  private

  def generate_game_objects
    @world.spawn_points(100).each do
      x, y = @world.spawn_point
      item_type = @item_type_pool.types.select { |t| t.category == :consumption || t.category == :material }.sample
      Item.new(@object_pool, x, y, item_type)

      x, y = @world.spawn_point
      Character.new(@object_pool, AiInput.new(@object_pool), x, y)
    end
  end
end
