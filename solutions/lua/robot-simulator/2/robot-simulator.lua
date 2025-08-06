local R = { north = "east", east = "south", south = "west", west = "north" }
local L = { north = "west", east = "north", south = "east", west = "south" }
local P = { north = { 0, 1 }, east = { 1, 0 }, south = { 0, -1 }, west = { -1, 0 } }
return function(config)
  config.move = function(self, commands)
    commands:gsub('.', function(c)
      if c == 'A' then self.x, self.y = self.x + P[self.heading][1], self.y + P[self.heading][2]
      elseif c == 'L' then self.heading = L[self.heading]
      elseif c == 'R' then self.heading = R[self.heading]
      else error("Unknown command: " .. c)
      end
    end)
  end
  return config
end
