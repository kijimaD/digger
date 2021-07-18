# frozen_string_literal: true

# Components make up a game_object.
class Component
  attr_reader :object

  def initialize(game_object = nil)
    self.object = game_object
  end

  def update; end

  def draw; end

  protected

  def object=(obj)
    return unless obj

    @object = obj
    obj.components << self
  end
end
