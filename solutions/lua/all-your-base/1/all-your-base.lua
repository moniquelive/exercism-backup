return {
  convert = function(from_digits, from_base)
    assert(from_base >= 2, "invalid input base")
    local int = 0
    for _, d in ipairs(from_digits) do
      assert(d >= 0, "negative digits are not allowed")
      assert(d < from_base, "digit out of range")
      int = int * from_base + d
    end
    return {
      to = function(to_base)
        assert(to_base >= 2, "invalid output base")
        local res = setmetatable({}, { __index = table })
        while int > 0 do
          res:insert(1, int % to_base)
          int = int // to_base
        end
        return next(res) == nil and { 0 } or res
      end
    }
  end
}
