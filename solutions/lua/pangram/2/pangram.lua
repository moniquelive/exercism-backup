return function(s)
  local letters = 0
  local a_byte = ("a"):byte()
  for ch in s:lower():gmatch("%a") do letters = letters | 1 << (ch:byte() - a_byte) end
  return letters == (1 << 26) - 1
end
