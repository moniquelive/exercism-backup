local all = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
local function _reset(l) return all:sub(l, l) .. all:sub(l, l) .. tostring(math.random(100, 999)) end
return {
  new = function()
    return {
      name = _reset(math.random(#all)),
      reset = function(self) self.name = _reset(math.random(#all)) end,
    }
  end
}
