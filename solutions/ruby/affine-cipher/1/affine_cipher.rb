# frozen_string_literal: true

# class Affine
class Affine
  def initialize(key_a, key_b)
    raise ArgumentError if key_a.gcd(26) != 1

    @key = Struct.new(:a, :b).new(key_a, key_b)
  end

  def encode(phrase)
    phrase.downcase
          .gsub(/\W/, '')
          .gsub(/[a-z]/) { (97 + (@key.a * (_1.ord - 97) + @key.b) % 26).chr }
          .scan(/.{1,5}/)
          .join(' ')
  end

  def decode(phrase)
    ainv = 1.upto(25).find { (_1 * @key.a) % 26 == 1 }
    phrase.gsub(/\W/, '')
          .gsub(/[a-z]/) { (97 + ainv * (_1.ord - 97 - @key.b) % 26).chr }
  end
end
