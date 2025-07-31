local SpaceAge = {}

function SpaceAge:new(seconds)
  local on_earth = seconds / (60 * 60 * 24 * 365.25)
  local round2 = function(x) return tonumber(("%.2f"):format(x)) end
  self.seconds = seconds
  self.on_earth = function() return round2(on_earth) end
  self.on_mercury = function() return round2(on_earth / 0.2408467) end
  self.on_venus = function() return round2(on_earth / 0.61519726) end
  self.on_mars = function() return round2(on_earth / 1.8808158) end
  self.on_jupiter = function() return round2(on_earth / 11.862615) end
  self.on_saturn = function() return round2(on_earth / 29.447498) end
  self.on_uranus = function() return round2(on_earth / 84.016846) end
  self.on_neptune = function() return round2(on_earth / 164.79132) end
  return self
end

return SpaceAge
