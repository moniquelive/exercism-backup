return {
  encode = function(plaintext)
    local lowerZ, lowerA = ("z"):lower():byte(), ("a"):lower():byte()
    return plaintext:lower():gsub('%W', ''):gsub("%a", function(ch)
      return string.char(lowerA + lowerZ - ch:byte())
    end):gsub(('.'):rep(5), '%1 '):gsub("%s+$", "")
  end
}
