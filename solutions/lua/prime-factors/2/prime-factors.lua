return function(input)
  local d, result = 2, setmetatable({}, { __index = table })
  while d <= input do
    while input % d == 0 do
      result:insert(d)
      input = input / d
    end
    d = d + 1
  end
  return result
end
