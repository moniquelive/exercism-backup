# frozen_string_literal: true

# class Series
class Series
  def initialize(digits) = digits.match?(/^\d*$/)
    && (@digits = digits.chars.map(&:to_i))
    || raise(ArgumentError)

  def largest_product(span) = (0..@digits.length).cover?(span)
    && @digits.each_cons(span).map { _1.reduce(:*) }.max
    || raise(ArgumentError)
end
