return function(s)
  local seen = {}
  for ch in s:lower():gmatch('%a') do
    if seen[ch] then return false else seen[ch] = true end
  end
  return true
end
