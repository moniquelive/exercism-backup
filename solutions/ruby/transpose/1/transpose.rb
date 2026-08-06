# frozen_string_literal: true

# module Transpose
module Transpose
  def self.transpose(str)
    [].tap do |result|
      str.split("\n").each_with_index do |line, padding|
        line.each_char.with_index do |ch, i|
          result[i] ||= ''
          pad = [padding - result[i].length, 0].max
          result[i] += ' ' * pad + ch
        end
      end
    end.join("\n")
  end
end
