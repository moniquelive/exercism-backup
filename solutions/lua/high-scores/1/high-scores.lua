return function(scores)
  local s, desc = scores, { table.unpack(scores) }
  table.sort(desc, function(a, b) return a > b end)
  return {
    high_scores = s,
    scores = function() return s end,
    latest = function() return s[#s] end,
    personal_best = function() return desc[1] end,
    personal_top_three = function() return { desc[1], desc[2], desc[3] } end
  }
end
