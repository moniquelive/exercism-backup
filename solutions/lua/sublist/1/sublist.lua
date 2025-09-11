local function startsWith(l1, l2)
  if #l2 > #l1 then return false end
  for i = 1, #l2 do
    if l1[i] ~= l2[i] then return false end
  end
  return true
end

local function contains(l1, l2)
  if #l1 == 0 then return false end
  return startsWith(l1, l2) or contains(table.pack(table.unpack(l1, 2)), l2)
end

return function(l1, l2)
  if #l1 == #l2 and startsWith(l1, l2) then return "equal" end
  if contains(l1, l2) then return "superlist" end
  if contains(l2, l1) then return "sublist" end
  return "unequal"
end
