return function(s)
  local map = {}
  for i = 1, #s do
    local ch = string.lower(s:sub(i, i))
    if ch >= 'a' and ch <= 'z' then
      if map[ch] then return false end
      map[ch] = true
    end
  end
  return true
end
