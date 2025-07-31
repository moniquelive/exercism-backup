# frozen_string_literal: true

# LogLineParser class
class LogLineParser
  # [ERROR]: Invalid operation
  RE = /^\[(?<level>.+?)\]:(?<message>.*)/.freeze

  def initialize(line)
    @line = line
  end

  def message
    @line[RE, :message].strip
  end

  def log_level
    @line[RE, :level].downcase
  end

  def reformat
    "#{message} (#{log_level})"
  end
end
