# frozen_string_literal: true

# Utility functions
module Utils
  MEDIA_PATH = 'media'
  DATA_PATH = 'data/json'

  def self.media_path(file)
    File.join(File.dirname(File.dirname(__FILE__)), MEDIA_PATH, file)
  end

  def self.data_path(file)
    File.join(File.dirname(File.dirname(__FILE__)), DATA_PATH, file)
  end

  def self.load_json(file)
    File.open(data_path("#{file}.json")) do |j|
      JSON.parse(j.read, symbolize_names: true)
    end
  end

  def self.distance_between(x1, y1, x2, y2)
    dx = x1 - x2
    dy = y1 - y2
    Math.sqrt(dx * dx + dy * dy)
  end

  def self.point_at_distance(source_x, source_y, angle, distance)
    angle = (90 - angle) * Math::PI / 180
    x = source_x + Math.cos(angle) * distance
    y = source_y - Math.sin(angle) * distance
    [x, y]
  end
end
