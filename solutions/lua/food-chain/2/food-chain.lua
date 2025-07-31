local animals = { "fly", "spider", "bird", "cat", "dog", "goat", "cow", "horse" }
local intro_ = { ""
, "It wriggled and jiggled and tickled inside her."
, "How absurd to swallow a bird!"
, "Imagine that, to swallow a cat!"
, "What a hog, to swallow a dog!"
, "Just opened her throat and swallowed a goat!"
, "I don't know how she swallowed a cow!"
, "She's dead, of course!" }
local descr = { spider = " that wriggled and jiggled and tickled inside her" }
local function verse(which)
  local intro = ("I know an old lady who swallowed a %s.\n%s"):format(animals[which], intro_[which])
  if which == #animals then return intro .. "\n" end

  local function swallowed()
    local result = setmetatable({}, { __index = table })
    for i = which - 1, 1, -1 do
      local a = animals[i]
      result:insert(("She swallowed the %s to catch the %s%s."):format(animals[i + 1], a, descr[a] or ""))
    end
    if #result == 0 then return "" end
    return "\n" .. result:concat("\n") .. "\n"
  end
  return intro .. swallowed() .. "I don't know why she swallowed the fly. Perhaps she'll die.\n"
end

local function verses(from, to)
  local result = setmetatable({}, { __index = table })
  for i = from, to do result:insert(verse(i)) end
  return result:concat("\n") .. "\n"
end

local function sing() return verses(1, #animals) end

return { verse = verse, verses = verses, sing = sing }
