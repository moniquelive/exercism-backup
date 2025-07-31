local numbers = { "Ten", "Nine", "Eight", "Seven", "Six", "Five", "Four", "Three", "Two", "One", "No" }
return {
  recite = function(start_bottles, take_down)
    local s = ""
    local start = 10 - start_bottles
    for i = start + 1, start + take_down do
      if s ~= "" then s = s .. "\n" end
      local s1 = (i == #numbers - 1) and "" or "s"
      local s2 = (i + 1 == #numbers - 1) and "" or "s"
      s = s .. (
        "%s green bottle%s hanging on the wall,\n" ..
        "%s green bottle%s hanging on the wall,\n" ..
        "And if one green bottle should accidentally fall,\n" ..
        "There'll be %s green bottle%s hanging on the wall.\n"
      ):format(numbers[i], s1, numbers[i], s1, numbers[i + 1]:lower(), s2)
    end
    return s
  end
}
