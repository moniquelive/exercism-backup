#!/usr/bin/env ruby -w

module BookKeeping
  VERSION = 2
end

#
class RunLengthEncoding
  def self.encode(str)
    str
      .chars                                        # split in chars
      .chunk { |c| c }                              # chunk by consecutive
      .map { |c, reps| Block.encode(c, reps.size) } # count
      .join
  end

  def self.decode(str)
    str
      .scan(/\d*./)                        # (opt) count + char
      .map { |chunk| Block.decode(chunk) } # multiply char by count
      .join
  end
end

require 'active_support/core_ext/object/blank'
#
class Block
  def self.encode(char, count)
    "#{count if count > 1}#{char}"
  end

  def self.decode(str)
    /(?<count>\d*)(?<char>.)/ =~ str
    char * (count.presence || 1).to_i
  end
end