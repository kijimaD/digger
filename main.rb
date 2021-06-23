require 'curses'
require 'singleton'

root_dir = File.dirname(__FILE__)
require_pattern = File.join(root_dir, '**/*.rb')

# Dynamically require everything
Dir.glob(require_pattern).each do |f|
  next if f.end_with?('/main.rb')
  next if f.include?('/spec')

  require_relative f.gsub("#{root_dir}/", '')
end

$game = GameWindow.new
GameState.switch(FieldState.instance)
