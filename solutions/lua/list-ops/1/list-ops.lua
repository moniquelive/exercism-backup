local function append(xs, ys)
  for _, v in ipairs(ys) do table.insert(xs, v) end
  return xs
end

local function concat(...)
  local result = {}
  for _, v in ipairs(table.pack(...)) do result = append(result, v) end
  return result
end

local function reverse(xs)
  local result = {}
  for _, v in ipairs(xs) do table.insert(result, 1, v) end
  return result
end

local function foldl(xs, value, f)
  if #xs == 0 then return value end
  return foldl({ table.unpack(xs, 2) }, f(value, xs[1]), f)
end

local function map(xs, f)
  local result = {}
  for _, v in ipairs(xs) do table.insert(result, f(v)) end
  return result
end

local function filter(xs, pred)
  local result = {}
  for _, v in ipairs(xs) do
    if pred(v) then table.insert(result, v) end
  end
  return result
end

return {
  append = append,
  concat = concat,
  length = function(xs) return #xs end,
  reverse = reverse,
  map = map,
  foldl = foldl,
  foldr = function(xs, value, f) return foldl(reverse(xs), value, f) end,
  filter = filter
}
