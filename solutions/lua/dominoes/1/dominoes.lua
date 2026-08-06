local function can_chain(dominoes, chains)
  chains = chains or {}
  if #dominoes == 0 then return #chains == 0 or chains[1][1] == chains[#chains][2] end
  if #chains == 0 then
    local n = { table.unpack(dominoes) }
    local f = table.remove(n, 1)
    return can_chain(n, { f })
  end
  for i in ipairs(dominoes) do
    local n = { table.unpack(dominoes) }
    local c = table.remove(n, i)
    if c[1] == chains[#chains][2] and
        can_chain(n, { table.unpack(chains), c }) then
      return true
    end
    if c[2] == chains[#chains][2] and
        can_chain(n, { table.unpack(chains), { c[2], c[1] } }) then
      return true
    end
  end
  return false
end

return { can_chain = can_chain }
