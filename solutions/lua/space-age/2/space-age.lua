local SpaceAge = {}

local factors = {
  on_earth = 1,
  on_mercury = 0.2408467,
  on_venus = 0.61519726,
  on_mars = 1.8808158,
  on_jupiter = 11.862615,
  on_saturn = 29.447498,
  on_uranus = 84.016846,
  on_neptune = 164.79132,
}
function SpaceAge:new(seconds)
  self.__index = function(this, key)
    local on_earth = this.seconds / (60 * 60 * 24 * 365.25)
    return function() return tonumber(("%.2f"):format(on_earth / factors[key])) end
  end
  return setmetatable({ seconds = seconds }, self)
end

return SpaceAge
