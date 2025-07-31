local function modifier(input) return (input - 10) // 2 end
local function ability(scores)
  scores = scores or { math.random(1, 6), math.random(1, 6), math.random(1, 6), math.random(1, 6) }
  table.sort(scores, function(a, b) return a > b end)
  return scores[1] + scores[2] + scores[3]
end

local Character = {}
function Character:new(name)
  local constitution = ability()
  return {
    name = name,
    strength = ability(),
    dexterity = ability(),
    constitution = constitution,
    intelligence = ability(),
    wisdom = ability(),
    charisma = ability(),
    hitpoints = 10 + modifier(constitution),
  }
end

return { Character = Character, ability = ability, modifier = modifier }
