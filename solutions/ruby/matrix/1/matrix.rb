# frozen_string_literal: true

# Matrix class
class Matrix
  def initialize(matrix)
    @matrix = matrix.split("\n")
                    .map(&:split)
                    .map { |row| row.map(&:to_i) }
  end

  def rows
    @matrix
  end

  def columns
    @matrix.transpose
  end
end
