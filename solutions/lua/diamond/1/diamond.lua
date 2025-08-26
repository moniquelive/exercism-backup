local function line(width, index)
  local chAscii = string.char(65 + index)
  local half = (' '):rep(width - index - 1) .. chAscii .. (' '):rep(index)
  return half .. half:sub(1, -2):reverse()
end

return function(which)
  local lines = setmetatable({}, { __index = table })
  local delta = which:byte() - 65 + 1
  for i = 0, delta - 1 do lines:insert(line(delta, i)) end
  for i = delta - 2, 0, -1 do lines:insert(line(delta, i)) end
  return lines:concat('\n') .. (delta > 0 and '\n' or '')
end
