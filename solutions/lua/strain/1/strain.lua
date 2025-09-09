local function keep(xs, pred)
  local result = setmetatable({}, { __index = table })
  for _, x in ipairs(xs) do
    if pred(x) then result:insert(x) end
  end
  return result
end

local function discard(xs, pred)
  return keep(xs, function(...) return not (pred(...)) end)
end

return { keep = keep, discard = discard }
