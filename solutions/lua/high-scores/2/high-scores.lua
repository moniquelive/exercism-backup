return function(scores)
  local desc = { table.unpack(scores) }
  table.sort(desc, function(a, b) return a > b end)
  return {
    scores = function() return scores end,
    latest = function() return scores[#scores] end,
    personal_best = function() return desc[1] end,
    personal_top_three = function() return { table.unpack(desc, 1, 3) } end
  }
end
