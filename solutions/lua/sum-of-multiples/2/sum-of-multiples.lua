return function(numbers)
  return {
    to = function(limit)
      local uniques, sum = {}, 0
      for _, n in ipairs(numbers) do
        for i = n, limit - 1, n do uniques[i] = true end
      end
      for u in pairs(uniques) do sum = sum + u end
      return sum
    end
  }
end
