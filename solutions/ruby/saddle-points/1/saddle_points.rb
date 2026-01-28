module Grid
  def self.saddle_points(matrix)
    result = []
    matrix.each_with_index do |row, i|
      row.each_with_index do |n, j|
        min_c = matrix.map { |row| row[j] }.min
        result << { 'row' => i + 1, 'column' => j + 1 } if n == row.max && n == min_c
      end
    end
    result
  end
end
