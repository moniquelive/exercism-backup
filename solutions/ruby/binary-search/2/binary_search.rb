class BinarySearch
  def initialize(array)= @array = array

  def search_for(target, low = 0, high = @array.size - 1)
    avg = (low + high) / 2
    if low > high then nil
    elsif target < @array[avg] then search_for(target, low, avg - 1)
    elsif target > @array[avg] then search_for(target, avg + 1, high)
    else avg
    end
  end
end
