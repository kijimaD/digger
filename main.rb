require 'io/console'
require 'curses'
include Curses

root_dir = File.dirname(__FILE__)
require_pattern = File.join(root_dir, '**/*.rb')

# Dynamically require everything
Dir.glob(require_pattern).each do |f|
  next if f.end_with?('/main.rb')
  next if f.include?('/spec')

  require_relative f.gsub("#{root_dir}/", '')
end

# Run script.
class Main
  def initialize
    @game_window = GameWindow.new
    @map = Map.new
    @player = Character.new
  end

  def run
    loop do
      @game_window.window.clear
      @game_window.window.addstr(@map.map_with_player(@player))
      @game_window.window.refresh

      case getch
      when 'w'
        @player.up
      when 'a'
        @player.left
      when 's'
        @player.down
      when 'd'
        @player.right
      when 'c'
        exit
      end
    end
  end
end

Main.new.run
