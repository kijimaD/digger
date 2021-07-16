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
end
