local function count(dice, number)
  local c = 0
  for _, v in ipairs(dice) do if v == number then c = c + 1 end end
  return c
end
local function sum(dice)
  local s = 0
  for _, v in ipairs(dice) do s = s + v end
  return s
end
local function full_house(dice)
  local f = dice[1] == dice[2] and dice[2] ~= dice[3] and dice[3] == dice[5] -- AABBB
  local s = dice[1] == dice[3] and dice[3] ~= dice[4] and dice[4] == dice[5] -- AAABB
  return f or s
end
local numbers = { ["ones"] = 1, ["twos"] = 2, ["threes"] = 3, ["fours"] = 4, ["fives"] = 5, ["sixes"] = 6 }
return {
  score = function(dice, category)
    table.sort(dice)
    local number = numbers[category]
    if number then
      return number * count(dice, number)
    elseif category == "full house" then
      return full_house(dice) and sum(dice) or 0
    elseif category == "four of a kind" then
      return (dice[1] == dice[4] or dice[2] == dice[5]) and 4 * dice[2] or 0
    elseif category == "little straight" then
      return (dice[1] == 1 and dice[2] == 2 and dice[3] == 3 and dice[4] == 4 and dice[5] == 5) and 30 or 0
    elseif category == "big straight" then
      return (dice[1] == 2 and dice[2] == 3 and dice[3] == 4 and dice[4] == 5 and dice[5] == 6) and 30 or 0
    elseif category == "choice" then
      return sum(dice)
    elseif category == "yacht" then
      return (dice[1] == dice[5]) and 50 or 0
    end
  end
}
