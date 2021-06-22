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
  include Curses

  def initialize
    init_screen
    width = 20
    @win = Window.new(5, width, (lines - 5) / 2, (cols - width) / 2)
    crmode
    setpos((lines - 5) / 2, (cols - 10) / 2)
    cbreak
    noecho
    curs_set(0)

    @map = Map.new
    @player = Character.new
  end

  def run
    loop do
      @win.clear
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

      @win.addstr(@map.map_with_player(@player))
      @win.refresh
    end
  end
end

Main.new.run
