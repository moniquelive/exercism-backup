return {
  rotate = function(input, key)
    local rotate = function(base, c)
      return string.char(
        string.byte(base) + (string.byte(c) - string.byte(base) + key) % 26
      )
    end
    local rotated = ""
    for c in input:gmatch(".") do
      rotated = rotated .. (c:match("%l") and rotate('a', c) or
        c:match("%u") and rotate('A', c) or
        c)
    end
    return rotated
  end
}
