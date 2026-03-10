# frozen_string_literal: true

module RailFenceCipher
  def self.encode(message, rails)
    Array.new(rails) { String.new }.tap do |rows|
      rail_path(message.length, rails).zip(message.chars) do |rail, char|
        rows[rail] << char
      end
    end.join
  end

  def self.decode(message, rails)
    positions_by_rail = Array.new(rails) { [] }
    rail_path(message.length, rails).each_with_index do |rail, index|
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

  def self.rail_path(length, rails)
    rail = 0
    direction = -1

    length.times.map do
      current_rail = rail

      direction *= -1 if rail.zero? || rail == rails - 1
      rail += direction

      current_rail
    end
  end
  private_class_method :rail_path
end
