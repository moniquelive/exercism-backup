return function(target, coins)
  assert(target >= 0, "target can't be negative")
  local changes = { [0] = {} }
  for t = 1, target do
    local best = nil
    for _, coin in ipairs(coins) do
      local prev = changes[t - coin]
      if prev then
        local candidate = { coin, table.unpack(prev) }
        if best == nil or #candidate < #best then best = candidate end
      end
    end
    changes[t] = best
  end
  return assert(changes[target], "can't make target with given coins")
end
