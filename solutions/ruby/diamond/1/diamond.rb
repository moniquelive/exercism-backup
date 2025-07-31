# frozen_string_literal: true

module Diamond
  def self.make_diamond(letter)
    delta = letter.ord - 'A'.ord + 1
    top = (0..delta-1).map { |d| line(delta, d) }
    bottom = (delta-2).downto(0).map { |d| line(delta, d) }
    (top + bottom).join("\n") + "\n"
  end

  def self.line(w, n)
    spc_before = ' ' * (w-n-1)
    ch = ('A'.ord + n).chr
    spc_after = ' ' * n

    half = spc_before + ch + spc_after
    half + half.chop.reverse
  end
end
