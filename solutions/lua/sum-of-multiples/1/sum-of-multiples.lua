return function(numbers)
  return {
    to = function(limit)
      local uniques = {}
      for i = 1, limit - 1 do
        for _, n in ipairs(numbers) do
          if i % n == 0 then uniques[i] = true end
        end
      end
      local sum = 0
      for m in pairs(uniques) do sum = sum + m end
      return sum
    end
  }
end
