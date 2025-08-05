local verse = "For want of a %s the %s was lost.\n"
local ending = "And all for the want of a %s.\n"

return {
  recite = function(strings)
    local res = ""
    for i = 2, #strings do
      res = res .. verse:format(strings[i - 1], strings[i])
    end
    if #strings > 0 then res = res .. ending:format(strings[1]) end
    return res
  end
}
