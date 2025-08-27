return {
  new = function(_ --[[self]])
    return {
      r = {},
      n = {},
      add = function(self, name, grade)
        if self.n[name] then return false end
        self.n[name], self.r[grade] = true, self.r[grade] or {}
        table.insert(self.r[grade], name)
        table.sort(self.r[grade])
        return true
      end,
      roster = function(self)
        local roster = {}
        for _, v in pairs(self.r) do
          for _, n in ipairs(v) do table.insert(roster, n) end
        end
        return roster
      end,
      grade = function(self, grade) return self.r[grade] or {} end,
    }
  end
}
