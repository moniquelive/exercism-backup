return function(phrase)
  local rules = function (phrase)
    local p2 = string.sub(phrase, 1, 2)
    local r1 = (string.match(phrase, "^[aeiou]") or p2 == "xr" or p2 == "yt" or p2 == "ay")
    local r3 = string.match(phrase, "^([bcdfghjklmnpqrstvwxyz]*qu)")
    local r4 = string.match(phrase, "^([bcdfghjklmnpqrstvwxyz]+)y")
    local r2 = string.match(phrase, "^[bcdfghjklmnpqrstvwxyz]+")
    return r1 and (phrase .. "ay")
      or r3 and (string.sub(phrase, r3:len()+1) .. r3 .. "ay")
      or r4 and (string.sub(phrase, r4:len()+1) .. r4 .. "ay")
      or r2 and (string.sub(phrase, r2:len()+1) .. r2 .. "ay")
      or phrase
  end
  return phrase:gsub("(%w+)", rules)
end
