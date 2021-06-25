# Utility functions
module Utils
  MEDIA_PATH = 'media'.freeze

  def self.media_path(file)
    File.join(File.dirname(File.dirname(__FILE__)), MEDIA_PATH, file)
  end
end