return function(sum)
  local res = setmetatable({}, { __index = table })
  for a = 3, sum // 3 do
    local b_plus_c = sum - a
    local b = (b_plus_c * b_plus_c - a * a) // (2 * b_plus_c)
    local c = sum - a - b
    if a < b and a * a + b * b == c * c then res:insert({ a, b, c }) end
  end
  return res
end
