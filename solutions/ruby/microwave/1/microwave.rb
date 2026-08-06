# frozen_string_literal: true

# class Microwave
class Microwave
  attr_reader :timer

  def initialize(power)
    h = power / 100
    m = power % 100
    @timer = format('%<h>02d:%<m>02d', { h: h + (m / 60),
                                         m: m % 60 })
  end
end
