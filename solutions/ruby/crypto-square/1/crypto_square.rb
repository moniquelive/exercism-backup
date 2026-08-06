# frozen_string_literal: true

# class Crypto
class Crypto
  attr_reader :ciphertext

  def initialize(plaintext)
    @ciphertext = plaintext.downcase.gsub(/\W/, '')
    cols = Math.sqrt(@ciphertext.size).ceil
    rows = (@ciphertext.size.to_f / cols).ceil
    @ciphertext = @ciphertext
                  .ljust(rows * cols)
                  .chars
                  .each_slice(cols)
                  .to_a
                  .transpose
                  .map(&:join)
                  .join(' ')
  rescue StandardError
  end
end
