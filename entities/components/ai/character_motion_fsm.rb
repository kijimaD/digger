# frozen_string_literal: true

# Character state machine.
class CharacterMotionFSM
  attr_reader :current_state

  def initialize(object, vision)
    @object = object
    @vision = vision
    @roaming_state = CharacterRoamingState.new(object, vision)
    @chasing_state = CharacterChasingState.new(object, vision)
    switch_state(@roaming_state)
    @target = nil
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

  def choose_state
    if @vision.find_closest_player
      change_target(@vision.closest_player) if @vision.closest_player != @target
      new_state = @chasing_state
    else
      @target = nil
      new_state = @roaming_state
    end

    switch_state(new_state)
  end

  def change_target(new_target)
    @target = new_target
  end
end
