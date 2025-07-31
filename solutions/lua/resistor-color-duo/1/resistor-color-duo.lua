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
  value = function(colors)
    return color_map[colors[1]] * 10 + color_map[colors[2]]
  end
}
