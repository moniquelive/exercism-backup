return {
  valid = function(isbn)
    if isbn:find("[^-%dX]") or isbn:find(".+X.+") then return false end
    local sum, n = 0, 10
    for ch in isbn:gmatch("[%dX]") do
      sum, n = sum + n * (tonumber(ch) or 10), n - 1
    end
    return n == 0 and sum % 11 == 0
  end
}
