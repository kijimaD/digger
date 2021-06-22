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

  ROOM = <<ROOM
  #---#
  |###|
  |###|
  |###|
  #---#
ROOM

  def run
    @x = 1
    @y = 1

    init_screen
    begin
      width = 20
      @win = Window.new(5, width, (lines - 5) / 2, (cols - width) / 2)
      crmode
      setpos((lines - 5) / 2, (cols - 10) / 2)
      cbreak
      noecho
      # stdscr.nodelay = 1
      curs_set(0)

      loop do
        @win.clear
        char = getch

        case char
        when 'w'
          @y -= 1
        when 'a'
          @x -= 1
        when 's'
          @y += 1
        when 'd'
          @x += 1
        when 'c'
          exit
        end

        @win.addstr(plus_player_map)
        @win.refresh
      end
    ensure
      close_screen
    end
  end

  def dimension
    ROOM.gsub(' ', '').split("\n").map(&:chars)
  end

  def plus_player_map
    p_dimension = dimension
    p_dimension[@y][@x] = '@'
    p_dimension.map { |row| row }.map(&:join).join("\n")
  end
end

Main.new.run
