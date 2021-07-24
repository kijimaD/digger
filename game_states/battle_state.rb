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
    @monsters.each do |monster|
      $game.window.setpos(2, 2)
      $game.window.addstr(monster.type.name)
      $game.window.setpos(4, 2)
      $game.window.addstr('*' * monster.hp)
    end
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
end
