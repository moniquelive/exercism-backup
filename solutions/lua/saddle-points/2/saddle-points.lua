local function col(n, input)
  local res = setmetatable({}, { __index = table })
  for _, c in ipairs(input) do res:insert(c[n]) end
  return res
end
return function(matrix)
  local res = setmetatable({}, { __index = table })
  for i, row in ipairs(matrix) do
    for j, n in ipairs(row) do
      local max_r = math.max(table.unpack(row))
      local min_c = math.min(table.unpack(col(j, matrix)))
      if n == max_r and n == min_c then res:insert({ row = i, column = j }) end
    end
  end
  return res
end
