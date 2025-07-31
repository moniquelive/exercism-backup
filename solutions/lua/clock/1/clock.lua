local tostring = function(c) return ("%02d:%02d"):format(c.hour, c.minute) end
local normal = function(h, m) return math.floor((h + m / 60) % 24), math.floor(m % 60) end
return {
  at = function(h, m)
    h, m = normal(h, m or 0)
    return setmetatable({
      hour = h,
      minute = m,
      equals = function(self, other) return self.hour == other.hour and self.minute == other.minute end,
      minus = function(self, delta) return self:plus(-delta) end,
      plus = function(self, delta)
        self.hour, self.minute = normal(self.hour, self.minute + delta)
        return self
      end
    }, { __tostring = tostring })
  end,
}
