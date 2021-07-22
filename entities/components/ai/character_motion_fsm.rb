# frozen_string_literal: true

# Character state machine.
class CharacterMotionFSM
  def initialize(object, vision)
    @object = object
    @vision = vision
    @roaming_state = CharacterRoamingState.new(object, vision)
    @chasing_state = CharacterChasingState.new(object, vision)
    switch_state(@roaming_state)
  end

  def draw; end

  def on_collision(with)
    # @current_state.on_collision(with)
  end

  def update
    choose_state
    @current_state.update
  end

  def switch_state(state)
    return unless state
    return if state == @current_state

    @current_state = state
    state.enter
  end

  def choose_state; end
end
