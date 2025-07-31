return {
  rotate = function(input, key)
    local function rotate(base, c)
      return string.char(base:byte() + (c:byte() - base:byte() + key) % 26)
    end
    return input:gsub("%a", function(c)
      return c:match("%l") and rotate('a', c) or rotate('A', c)
    end)
  end
}
