local function r(n, input) return input[n] end
local function c(n, input)
  local col = setmetatable({}, { __index = table })
  for _, i in ipairs(input) do col:insert(i[n]) end
  return col
end
return function(matrix)
  local res = setmetatable({}, { __index = table })
  for i = 1, #matrix do
    for j = 1, #matrix[1] do
      local max_r = math.max(table.unpack(r(i, matrix)))
      local min_c = math.min(table.unpack(c(j, matrix)))
      if matrix[i][j] == max_r and matrix[i][j] == min_c then
        res:insert({ row = i, column = j })
      end
    end
  end
  return res
end
