local scores = { ['AEIOULNRST'] = 1, ['DG'] = 2, ['BCMP'] = 3, ['FHVWY'] = 4, ['K'] = 5, ['JX'] = 8, ['QZ'] = 10 }
return {
  score = function(word)
    local total = 0
    for ch in (word or ''):upper():gmatch(".") do
      for l, v in pairs(scores) do
        if l:match(ch) then
          total = total + v
          break
        end
      end
    end
    return total
  end
}
