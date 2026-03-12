# frozen_string_literal: true

# class SecretHandshake
class SecretHandshake
  attr_reader :commands

  SHAKES = { 8 => 'jump', 4 => 'close your eyes', 2 => 'double blink', 1 => 'wink' }.freeze
  def initialize(number) =
    @commands = [SHAKES[number & 8], SHAKES[number & 4], SHAKES[number & 2], SHAKES[number & 1]]
                .compact
                .send(number.anybits?(16) ? :itself : :reverse)
end
