# frozen_string_literal: true

# class Triangle
class Triangle
  attr_reader :rows

  def initialize(total) = @rows = total.times.with_object([]) do |row, rows|
    rows << (row.zero? ? [1] : rows.last.each_cons(2).map(&:sum).prepend(1).push(1))
  end
end
