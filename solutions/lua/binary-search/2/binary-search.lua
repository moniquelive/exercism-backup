return function(array, target)
  local function binary_search(low, high)
    local avg = (low + high) // 2
    return low > high and -1 or
        target < array[avg] and binary_search(low, avg - 1) or
        target > array[avg] and binary_search(avg + 1, high) or avg
  end
  return binary_search(1, #array)
end
