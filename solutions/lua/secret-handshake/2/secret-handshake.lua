return function(number)
  local result = setmetatable({}, { __index = table })
  if number & 16 > 0 then
    if number & 8 > 0 then result:insert('jump') end
    if number & 4 > 0 then result:insert('close your eyes') end
    if number & 2 > 0 then result:insert('double blink') end
    if number & 1 > 0 then result:insert('wink') end
  else
    if number & 1 > 0 then result:insert('wink') end
    if number & 2 > 0 then result:insert('double blink') end
    if number & 4 > 0 then result:insert('close your eyes') end
    if number & 8 > 0 then result:insert('jump') end
  end
  return result
end
