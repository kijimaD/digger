# frozen_string_literal: true

# Turn based battle state.
class BattleState < GameState
  include Singleton
  attr_accessor :field_state

  def enter; end

  def leave; end

  def draw
    # pass
  end

  def update
    # pass
  end

  def button_down(char)
    # pass
  end
end
