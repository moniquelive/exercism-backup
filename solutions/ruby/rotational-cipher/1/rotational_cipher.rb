# frozen_string_literal: true

module RotationalCipher
  def self.rotate(text, rot)
    rotate_char = ->(c, rot, a_ord) { ((c.ord - a_ord + rot) % 26 + a_ord).chr }
    text.chars.map do |c|
      ('a'..'z').include?(c) ? rotate_char.(c, rot, 'a'.ord) :
        ('A'..'Z').include?(c) ? rotate_char.(c, rot, 'A'.ord) :
        c
    end.join('')
  end
end
