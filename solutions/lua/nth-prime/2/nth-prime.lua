local function is_prime(k)
  if k <= 1 then return false end
  if k == 2 or k == 3 then return true end
  if k % 2 == 0 or k % 3 == 0 then return false end
  local upto = 1 + math.sqrt(k)
  for i = 5, upto, 6 do
    if k % i == 0 or k % (i + 2) == 0 then
      return false
    end
  end
  return true
end

return function(n)
  assert(n > 0)
  for i = 2, math.huge do
    if is_prime(i) then n = n - 1 end
    if n == 0 then return i end
  end
end
