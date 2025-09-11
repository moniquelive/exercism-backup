local re = {
  first = "^(-?%d+)",
  add = "^ plus (-?%d+)",
  sub = "^ minus (-?%d+)",
  mul = "^ multiplied by (-?%d+)",
  div = "^ divided by (-?%d+)",
}
return {
  answer = function(question)
    question = question:gsub("^What is ", "")
    local result = tonumber(question:match(re.first))
    question = question:gsub(re.first, "")
    while question ~= "?" do
      local add, sub = question:match(re.add), question:match(re.sub)
      local mul, div = question:match(re.mul), question:match(re.div)
      if add then
        result = result + tonumber(add)
        question = question:gsub(re.add, "")
      elseif sub then
        result = result - tonumber(sub)
        question = question:gsub(re.sub, "")
      elseif mul then
        result = result * tonumber(mul)
        question = question:gsub(re.mul, "")
      elseif div then
        result = result / tonumber(div)
        question = question:gsub(re.div, "")
      else
        error("Invalid question")
      end
    end
    return result
  end
}
