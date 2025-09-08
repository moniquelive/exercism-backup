return function(s, length)
  assert(s ~= "", "series cannot be empty")
  assert(length <= s:len(), "slice length cannot be greater than series length")
  assert(length ~= 0, "slice length cannot be zero")
  assert(length > 0, "slice length cannot be negative")
  local i = 0
  return function()
    i = i + 1
    if i <= s:len() - length + 1 then return s:sub(i, i + length - 1) end
  end
end
