# frozen_string_literal: true

# Character interactive parameters
class Stats
  attr_accessor :messages

  LOG_LENGTH = 20

  def initialize
    @messages = []
  end

  def add_message(message)
    @messages << message
    @messages.shift while @messages.length > LOG_LENGTH
  end
end
