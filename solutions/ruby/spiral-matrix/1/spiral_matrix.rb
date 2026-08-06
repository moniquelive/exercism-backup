class SpiralMatrix
  def initialize(size) = @size = size

  def matrix
    Array.new(@size) { Array.new(@size, 0) }.tap do |m|
      top = left = 0
      bottom = right = @size - 1
      val = 1

      while val <= @size * @size
        left.upto(right) do |i|
          m[top][i] = val
          val += 1
        end
        top += 1

        top.upto(bottom) do |i|
          m[i][right] = val
          val += 1
        end
        right -= 1

        right.downto(left) do |i|
          m[bottom][i] = val
          val += 1
        end
        bottom -= 1

        bottom.downto(top) do |i|
          m[i][left] = val
          val += 1
        end
        left += 1
      end
    end
  end
end
