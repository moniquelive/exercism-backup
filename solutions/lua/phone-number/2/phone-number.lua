return {
  new = function(_, number)
    number = number:gsub("^1", ""):gsub("%D", "")
    number = number:len() == 10 and number or "0000000000"
    return setmetatable({ number = number, areaCode = function(self) return self.number:sub(1, 3) end },
      { __tostring = function(self) return self.number:gsub('(...)(...)(....)', "(%1) %2-%3") end })
  end
}
