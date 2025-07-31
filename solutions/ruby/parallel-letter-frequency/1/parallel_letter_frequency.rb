require 'thread'

class ParallelLetterFrequency
  class << self
    def count(texts)
        texts = texts.map(&:downcase).map { |s| s.gsub(/\P{Alphabetic}/, '') }.compact
        frequency_map = Hash.new(0)
        return frequency_map if texts.empty?

        threads = []
        texts.each_with_index do |text, i|
            threads << Thread.new do
                map = Hash.new(0)
                text.each_char do |c|
                    map[c] += 1
                end
                frequency_map = frequency_map.merge(map) { |key, oldval, newval| oldval + newval }
            end
        end
        threads.each(&:join)
        frequency_map
    end
  end
end