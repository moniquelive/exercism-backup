return {
  new = function(_ --[[self]], capacity)
    return {
      buffer = setmetatable({}, { __index = table }),
      read = function(self)
        assert(#self.buffer > 0, "buffer is empty")
        return self.buffer:remove(1)
      end,
      write = function(self, val)
        assert(#self.buffer < capacity, "buffer is full")
        self.buffer:insert(val)
      end,
      forceWrite = function(self, val)
        if #self.buffer == capacity then self:read() end
        self:write(val)
      end,
      clear = function(self)
        self.buffer = setmetatable({}, { __index = table })
      end
    }
  end,
}
