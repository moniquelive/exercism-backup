local verses = {
  { that = "lay in",      the = "house that Jack built." },
  { that = "ate",         the = "malt" },
  { that = "killed",      the = "rat" },
  { that = "worried",     the = "cat" },
  { that = "tossed",      the = "dog" },
  { that = "milked",      the = "cow with the crumpled horn" },
  { that = "kissed",      the = "maiden all forlorn" },
  { that = "married",     the = "man all tattered and torn" },
  { that = "woke",        the = "priest all shaven and shorn" },
  { that = "kept",        the = "rooster that crowed in the morn" },
  { that = "belonged to", the = "farmer sowing his corn" },
  { that = "",            the = "horse and the hound and the horn" },
}

local house = {}
house.verse = function(which)
  local result = ("This is the %s"):format(verses[which].the)
  for i = which - 1, 1, -1 do
    result = result .. ("\nthat %s the %s"):format(verses[i].that, verses[i].the)
  end
  return result
end

house.recite = function()
  local result = setmetatable({}, { __index = table })
  for i in ipairs(verses) do result:insert(house.verse(i)) end
  return result:concat("\n")
end

return house
