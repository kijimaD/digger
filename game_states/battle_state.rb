# frozen_string_literal: true

# Turn based battle state.
class BattleState < GameState
  attr_accessor :field_state
  attr_reader :monsters

  def initialize(character)
    super()
    @monsters = generate_monsters(character.type.id)
  end

  def enter; end

  def leave; end

  def draw
    monster_image
  end

  def update
    # pass
  end

  def button_down(char)
    case char
    when '-'
      @monsters.first.attack(5)
    when 'f'
      GameState.switch(@field_state) if $debug
    end
  end

  def generate_monsters(category)
    monsters = []
    monsters << Party.instance.monster_pool.select { |monster| monster.type.category == category }.sample
  end

  private

  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  def monster_image
    @monsters.each do |monster|
      world = monster.type.image.split("\n").slice(0..30).map { |y| y.slice(0..30) }
      world.each_with_index do |line, index|
        $game.window.setpos(1 + index, 1)
        $game.window.addstr(line)
      end

      $game.window.setpos(2 + world.length, 2)
      $game.window.addstr(monster.type.name)
      $game.window.setpos(4 + world.length, 2)
      $game.window.addstr(Utils.gauge(monster.hp, monster.max_hp))
    end
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize
end
