return function(input)
  local result = setmetatable({}, { __index = table })
  while input % 2 == 0 do
    result:insert(2)
    input = input // 2
  end
  local d = 3
  while d * d <= input do
    while input % d == 0 do
      result:insert(d)
      input = input // d
    end
    d = d + 2
  end
  if input > 2 then result:insert(input) end
  return result
end
