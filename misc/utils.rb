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

  def self.angle_between(x, y, target_x, target_y)
    dx = target_x - x
    dy = target_y - y
    (180 - Math.atan2(dx, dy) * 180 / Math::PI)
  end

  # rubocop:disable Metrics/MethodLength
  def self.angle_quarter(angle)
    if angle < 90
      result = 0
    elsif angle < 180
      result = 90
    elsif angle < 225
      result = 180
    elsif angle < 315
      result = 270
    elsif angle < 360
      result = 0
    end

    result
  end
  # rubocop:enable Metrics/MethodLength

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

  def self.gauge(current, max)
    return ('-' * 10) if current.negative?

    percent = (current.to_f / max * 10).round
    '|' * percent.to_i + '-' * (10 - percent)
  end
end
