return function(array, target)
  local function binary_search(low, high)
    if low > high then return -1 end
    local avg = (low + high) // 2
    local value = array[avg]
    if target < value then return binary_search(low, avg - 1) end
    if target > value then return binary_search(avg + 1, high) end
    return avg
  end
  return binary_search(1, #array)
end
