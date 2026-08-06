module Grid
  def self.saddle_points(matrix)
    t = matrix.transpose
    matrix.flat_map.with_index do |row, i|
      row.filter_map.with_index do |n, j|
        { 'row' => i + 1, 'column' => j + 1 } \
          if n == row.max && n == t[j].min
      end
    end
  end
end
