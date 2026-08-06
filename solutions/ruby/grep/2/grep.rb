# frozen_string_literal: true

# class Grep
class Grep
  def self.grep(pattern, flags, files) =
    run(files,
        build_matcher(pattern, flags),
        flags.include?('-l'),
        flags.include?('-n'),
        flags.include?('-v'),
        files.length > 1)

  def self.run(files, matcher, list_files, number_lines, invert, multiple_files)
    files.flat_map do |file|
      matches = File.foreach(file, chomp: true).with_index(1).filter_map do |line, index|
        match = matcher.match?(line)
        next if match == invert
        next file if list_files

        line = "#{index}:#{line}" if number_lines
        line = "#{file}:#{line}" if multiple_files
        line
      end
      list_files && matches.first(1) || matches
    end.join("\n")
  end

  def self.build_matcher(pattern, flags)
    source = Regexp.escape(pattern)
    source = "^#{source}$" if flags.include?('-x')
    Regexp.new(source, flags.include?('-i') ? Regexp::IGNORECASE : 0)
  end

  private_class_method :build_matcher, :run
end
