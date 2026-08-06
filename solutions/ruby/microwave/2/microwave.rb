# frozen_string_literal: true

# class Microwave
class Microwave
  attr_reader :timer

  def initialize(power)
    a, b = power.divmod(100)
    m, s = b.divmod(60)
    @timer = format('%<m>02d:%<s>02d', m: a + m, s: s)
  end
end
