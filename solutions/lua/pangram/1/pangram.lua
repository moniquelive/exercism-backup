return function(s)
  local letters = 0
  local a_byte = ("a"):byte()
  for ch in s:gmatch(".") do
    if ch:match("%w") then letters = letters | 1 << (ch:lower():byte() - a_byte) end
  end
  return letters == (1 << 26) - 1
end
