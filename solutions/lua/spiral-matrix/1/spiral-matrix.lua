return function(size)
  local m = {}
  for i = 1, size do m[i] = {} end

  local top, bottom = 1, size
  local left, right = 1, size
  local val = 1
  while val <= size * size do
    for i = left, right do
      m[top][i] = val
      val = val + 1
    end
    top = top + 1

    for i = top, bottom do
      m[i][right] = val
      val = val + 1
    end
    right = right - 1

    for i = right, left, -1 do
      m[bottom][i] = val
      val = val + 1
    end
    bottom = bottom - 1

    for i = bottom, top, -1 do
      m[i][left] = val
      val = val + 1
    end
    left = left + 1
  end
  return m
end
