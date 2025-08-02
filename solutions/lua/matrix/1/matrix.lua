return function(s)
  local rows = setmetatable({}, { __index = table })
  local columns = setmetatable({}, { __index = table })
  for line in s:gmatch("[^\r\n]+") do
    local numbers = setmetatable({}, { __index = table })
    line:gsub("%d+", function(n) numbers:insert(tonumber(n)) end)
    rows:insert(numbers)
  end
  for i = 1, #rows do
    columns:insert(setmetatable({}, { __index = table }))
    for _, r in ipairs(rows) do
      columns[#columns]:insert(r[i])
    end
  end
  return {
    column = function(i) return columns[i] end,
    row = function(i) return rows[i] end
  }
end
