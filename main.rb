# frozen_string_literal: true

require 'curses'
require 'singleton'

root_dir = File.dirname(__FILE__)
require_pattern = File.join(root_dir, '**/*.rb')
@failed = []

# Dynamically require everything
Dir.glob(require_pattern).each do |f|
  next if f.end_with?('/main.rb')
  next if f.include?('/spec')

  begin
    require_relative f.gsub("#{root_dir}/", '')
  rescue NameError
    # May fail if parent class not required yet
    @failed << f
  end
end

# Retry unresolved requires
@failed.each do |f|
  require_relative f.gsub("#{root_dir}/", '')
end

$debug = true if ARGV[0] == '--debug'

$game = GameWindow.new
GameState.switch(FieldState.instance)
$game.main_loop
