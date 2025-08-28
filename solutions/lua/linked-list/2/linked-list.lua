return function()
  local data = setmetatable({}, { __index = table })
  return {
    push = function(_, value) data:insert(1, value) end,
    unshift = function(_, value) data:insert(value) end,
    pop = function() return data:remove(1) end,
    shift = function() return data:remove() end,
    count = function() return #data end,
    delete = function(_, value)
      for i, v in pairs(data) do
        if v == value then return data:remove(i) end
      end
    end,
  }
end
