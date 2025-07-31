local color_map = {
  black = 0,
  brown = 1,
  red = 2,
  orange = 3,
  yellow = 4,
  green = 5,
  blue = 6,
  violet = 7,
  grey = 8,
  white = 9,
}
return {
  decode = function(c1, c2, c3)
    local val = (color_map[c1] * 10 + color_map[c2]) * (10 ^ color_map[c3])
    if val > 1000000000 then return (val / 1000000000), "gigaohms" end
    if val > 1000000 then return (val / 1000000), "megaohms" end
    if val > 1000 then return (val / 1000), "kiloohms" end
    return val, "ohms"
  end
}
