# frozen_string_literal: true

# class SecretHandshake
class SecretHandshake
  attr_reader :commands

  SHAKES = { 8 => 'jump', 4 => 'close your eyes', 2 => 'double blink', 1 => 'wink' }.freeze
  def initialize(number) =
    @commands = SHAKES.select { number.anybits?(_1) }
                      .values
                      .send(number.anybits?(16) ? :itself : :reverse)
end
