return {
  valid = function(isbn)
    if isbn:find("[^-%dX]") or isbn:find(".+X.+") then return false end
    local w, sum = 10, 0
    for ch in isbn:gmatch("[%dX]") do
      local v = (ch == "X" and 10) or ch:byte() - ("0"):byte()
      sum, w = sum + w * v, w - 1
    end
    return w == 0 and sum % 11 == 0
  end
}
