require 'io/console'

def main
  x = 1
  y = 1

  while c = STDIN.getch
    puts "\e[H\e[2J" # clear display
    # puts "You typed: #{c}"
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

    map = '#---#
           |###|
           |###|
           |###|
           #---#'
    test = map.gsub(' ', '').split("\n")

    plane = test.map(&:chars)

    plane[y][x] = '@'
    puts plane.map { |row| row }.map(&:join).join("\n")
  end
end

main
