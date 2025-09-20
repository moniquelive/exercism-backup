local function gcd(a, b)
  while b ~= 0 do a, b = b, a % b end
  return a
end

local function inv(n)
  for x = 1, 25 do
    if (x * n) % 26 == 1 then return x end
  end
end

return {
  encode = function(phrase, key)
    assert(gcd(key.a, 26) == 1, "a and m must be coprime.")
    return phrase:lower():gsub("[^%da-z]", ""):gsub("%l", function(ch)
          return string.char(97 + (key.a * (ch:byte() - 97) + key.b) % 26)
        end)
        :gsub("(.....)", "%1 "):gsub("%s+$", "")
  end,

  decode = function(phrase, key)
    assert(gcd(key.a, 26) == 1, "a and m must be coprime.")
    local ainv = inv(key.a)
    return phrase:gsub("[^%da-z]", ""):gsub("%l", function(ch)
      return string.char(97 + ainv * (ch:byte() - 97 - key.b) % 26)
    end)
  end
}
