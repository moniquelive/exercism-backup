return function(number)
  local result = setmetatable({}, { __index = table })
  if number & 1 > 0 then result:insert('wink') end
  if number & 2 > 0 then result:insert('double blink') end
  if number & 4 > 0 then result:insert('close your eyes') end
  if number & 8 > 0 then result:insert('jump') end
  if number & 16 > 0 then
    local n, m = #result, #result / 2
    for i = 1, m do result[i], result[n - i + 1] = result[n - i + 1], result[i] end
  end
  return result
end
