class BinarySearch
  def initialize(array)= @array = array

  def search_for(target)
    binary(0, @array.size - 1, target)
  end

  private

  def binary(low, high, target)
    avg = (low + high) / 2
    if low > high then nil
    elsif target < @array[avg] then binary(low, avg - 1, target)
    elsif target > @array[avg] then binary(avg + 1, high, target)
    else avg
    end
  end
end
