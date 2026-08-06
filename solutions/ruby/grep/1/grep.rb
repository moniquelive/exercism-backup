# frozen_string_literal: true

# module Grep
module Grep
  Match = Struct.new(:filename, :index, :line)

  def self.filegrep(flags, pattern, filename)
    File.open(filename).each_line(chomp: true).zip(1..).to_enum.filter_map do |line, index|
      match_line = line
      match_line = match_line.downcase if flags.include?('-i')
      Match.new(filename, index, line) if flags.include?('-v') == !match_line.match(pattern)
    end
  end

  def self.build_pattern(pattern, flags)
    pattern = "^#{pattern}$" if flags.include?('-x')
    pattern = pattern.downcase if flags.include?('-i')
    pattern
  end

  def self.grep(pattern, flags, files)
    pattern = build_pattern(pattern, flags)
    files.flat_map { filegrep(flags, pattern, _1) }.map do |match|
      line = match.line
      line = "#{match.index}:#{line}" if flags.include?('-n')
      line = "#{match.filename}:#{line}" if files.count > 1
      line = match.filename if flags.include?('-l')
      line
    end.uniq.join("\n")
  end
end
