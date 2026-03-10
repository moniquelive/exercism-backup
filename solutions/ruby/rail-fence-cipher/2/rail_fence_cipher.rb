# frozen_string_literal: true

module RailFenceCipher
  def self.encode(message, rails)
    Array.new(rails) { String.new }.tap do |rows|
      zig_zag(message.length, rails).zip(message.chars) do |rail, char|
        rows[rail] << char
      end
    end.join
  end

  def self.decode(message, rails)
    positions_by_rail = Array.new(rails) { [] }
    zig_zag(message.length, rails).each_with_index do |rail, index|
      positions_by_rail[rail] << index
    end

    Array.new(message.length).tap do |decoded|
      offset = 0
      positions_by_rail.each do |positions|
        positions.each do |index|
          decoded[index] = message[offset]
          offset += 1
        end
      end
    end.join
  end

  def self.zig_zag(length, rails) =
    ((0...rails).to_a + (1...(rails - 1)).to_a.reverse).cycle.take(length)
  private_class_method :zig_zag
end
