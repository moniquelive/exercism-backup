local next_heading = { north = "east", east = "south", south = "west", west = "north" }
local prev_heading = { north = "west", east = "north", south = "east", west = "south" }
return function(config)
  return {
    x = config.x,
    y = config.y,
    heading = config.heading,
    move = function(self, commands)
      for c in commands:gmatch('.') do
        if c == 'A' then
          self.x, self.y =
              self.x + (self.heading == "east" and 1 or self.heading == "west" and -1 or 0),
              self.y + (self.heading == "north" and 1 or self.heading == "south" and -1 or 0)
        elseif c == 'L' then
          self.heading = prev_heading[self.heading] or 'west'
        elseif c == 'R' then
          self.heading = next_heading[self.heading] or 'north'
        else
          error("Unknown command: " .. c)
        end
      end
    end
  }
end
