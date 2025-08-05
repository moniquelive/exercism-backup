local function aliquot_sum(n)
  local a = 0
  for f = 1, n / 2 do
    if n % f == 0 then a = a + f end
  end
  return a
end

local function classify(n)
  local a = aliquot_sum(n)
  if a < n then return "deficient" end
  if a > n then return "abundant" end
  return "perfect"
end

return { aliquot_sum = aliquot_sum, classify = classify }
