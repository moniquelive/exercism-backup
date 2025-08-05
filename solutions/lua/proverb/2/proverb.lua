local verse = "For want of a %s the %s was lost."
local ending = "And all for the want of a %s.\n"

return {
  recite = function(strings)
    local res = setmetatable({}, { __index = table })
    for i = 2, #strings do res:insert(verse:format(strings[i - 1], strings[i])) end
    if #strings > 0 then res:insert(ending:format(strings[1])) end
    return res:concat("\n")
  end
}
