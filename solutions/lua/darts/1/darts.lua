local Darts = {}

function Darts.score(x, y)
  local dist = math.sqrt((x * x) + (y * y))
  if dist > 10 then return 0 end
  if dist <= 1 then return 10 end
  if dist <= 5 then return 5 end
  return 1
end

return Darts
