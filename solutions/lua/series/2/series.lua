return function(s, length)
  assert(s ~= "", "series cannot be empty")
  assert(length <= s:len(), "slice length cannot be greater than series length")
  assert(length ~= 0, "slice length cannot be zero")
  assert(length > 0, "slice length cannot be negative")
  return coroutine.wrap(function()
    for i = 1, s:len() - length + 1 do
      coroutine.yield(s:sub(i, i + length - 1))
    end
  end)
end
