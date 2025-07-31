return {
  encode = function(plaintext)
    local lowerZ, lowerA = ("z"):lower():byte(), ("a"):lower():byte()
    local result = ""
    for ch in plaintext:lower():gmatch(".") do
      if ch >= "0" and ch <= "9" then result = result .. ch end
      if ch >= "a" and ch <= "z" then result = result .. string.char(lowerZ - (ch:byte() - lowerA)) end
      if #result % 6 == 5 then result = result .. " " end
    end
    return result:gsub("%s+$", "")
  end
}
