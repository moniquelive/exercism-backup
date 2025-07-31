local animals = { "fly", "spider", "bird", "cat", "dog", "goat", "cow", "horse" }
local function verse(which)
  local intro_ = { ""
  , "It wriggled and jiggled and tickled inside her."
  , "How absurd to swallow a bird!"
  , "Imagine that, to swallow a cat!"
  , "What a hog, to swallow a dog!"
  , "Just opened her throat and swallowed a goat!"
  , "I don't know how she swallowed a cow!"
  , "She's dead, of course!" }
  local intro = ("I know an old lady who swallowed a %s.\n%s"):format(animals[which], intro_[which])
  if which == #animals then return intro .. "\n" end

  local function swallowed()
    local descr = { [2] = " that wriggled and jiggled and tickled inside her" }
    local result = setmetatable({}, { __index = table })
    for i = which - 1, 1, -1 do
      result:insert(("She swallowed the %s to catch the %s%s."):format(animals[i + 1], animals[i], descr[i] or ""))
    end
    return #result == 0 and "" or "\n" .. result:concat("\n") .. "\n"
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
