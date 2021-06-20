require 'io/console'

def main
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
  end
end

main
