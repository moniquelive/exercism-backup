local function icombn(tbl, i, n, t, l)
  t = t or {}
  l = l or #tbl
  if n == 1 then
    local j = i
    return function()
      if j > l then return nil end
      t[n] = tbl[j]
      j = j + 1
      return t[n]
    end
  end
  local j = i
  local v = icombn(tbl, j + 1, n - 1, t)
  return function()
    if j > l then return nil end
    local x = v()
    if x == nil then
      j = j + 1
      v = icombn(tbl, j + 1, n - 1, t)
      x = v()
    end
    if x == nil then return nil end
    t[n] = tbl[j]
    return table.unpack(t)
  end
end

local function sum(t)
  local s = 0
  for _, v in ipairs(t) do s = s + v end
  return s
end

local function intersect(t, s)
  if not s then return false end
  local cs = {}
  for _, v in ipairs(s) do cs[v] = true end
  for _, tt in ipairs(t) do
    if cs[tt] then return true end
  end
  return false
end

return {
  combinations =
      function(s, size, exclude)
        local result = setmetatable({}, { __index = table })
        local comb = icombn({ 1, 2, 3, 4, 5, 6, 7, 8, 9 }, 1, size, nil, nil)
        while true do
          local c = { comb() }
          if #c == 0 then break end
          if sum(c) == s and not intersect(c, exclude) then
            table.sort(c)
            result:insert(c)
          end
        end
        return result
      end
}
