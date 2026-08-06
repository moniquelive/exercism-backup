# frozen_string_literal: true

# module Atbash
module Atbash
  A_Z = 'abcdefghijklmnopqrstuvwxyz'
  Z_A = A_Z.reverse
  def self.encode(plaintext) =
    plaintext
      .downcase
      .gsub(/\W/, '')
      .tr(A_Z, Z_A)
      .scan(/.{1,5}/)
      .join(' ')

  def self.decode(ciphertext) = encode(ciphertext).delete(' ')
end
