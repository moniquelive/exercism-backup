# frozen_string_literal: true

# class Cipher
class Cipher
  attr_reader :key

  def initialize(key = nil)
    @key = key || Array.new(100) { rand(97..122) }.map(&:chr).join
    raise ArgumentError unless @key =~ /[a-z]+/
  end

  def encode(plaintext) = shift(plaintext) { _1 + _2 }
  def decode(ciphertext) = shift(ciphertext) { _1 - _2 }

  private

  def shift(text, &block) =
    text.each_char.zip(@key.chars)
        .map { (block.call(_1.ord - 97, _2.ord - 97) % 26 + 97).chr }
        .join
end
