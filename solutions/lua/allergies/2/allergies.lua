local labels = { "eggs", "peanuts", "shellfish", "strawberries", "tomatoes", "chocolate", "pollen", "cats" }
local allergens = { eggs = 1, peanuts = 2, shellfish = 4, strawberries = 8, tomatoes = 16, chocolate = 32, pollen = 64, cats = 128 }

local function allergic_to(score, which) return score & allergens[which] > 0 end
local function list(score)
  local res = setmetatable({}, { __index = table })
  for _, l in ipairs(labels) do if allergic_to(score, l) then res:insert(l) end end
  return res
end

return { list = list, allergic_to = allergic_to }
