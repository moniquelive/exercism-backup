return {
  new = function(_, number)
    number = number:gsub("%D", "")
    if number:sub(1, 1) == "1" then number = number:sub(2, -1) end
    if #number ~= 10 then number = "0000000000" end
    return setmetatable({
      number = number,
      areaCode = function(self)
        return self.number:sub(1, 3)
      end
    }, {
      __tostring = function(self)
        return ("(%s) %s-%s"):format(
          self.number:sub(1, 3),
          self.number:sub(4, 6),
          self.number:sub(7, 10))
      end
    })
  end
}
