require 'io/console'

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
  @test_run = true if ARGV[0] == '--test-run'

  x = 1
  y = 1

  while (c = $stdin.getch)
    puts "\e[H\e[2J" # clear display

    case c
    when 'w'
      y -= 1
    when 'a'
      x -= 1
    when 's'
      y += 1
    when 'd'
      x += 1
    when 'c'
      exit
    end

    puts "#{x}, #{y}"

    map = <<ROOM
  #---#
  |###|
  |###|
  |###|
  #---#
ROOM

    plane = map.gsub(' ', '').split("\n").map(&:chars)
    plane[y][x] = '@'
    puts plane.map { |row| row }.map(&:join).join("\n")

    exit if @test_run
  end
end

main.new
