local function m(op)
  local regexp = ({
    add = "^ plus (-?%d+)",
    sub = "^ minus (-?%d+)",
    mul = "^ multiplied by (-?%d+)",
    div = "^ divided by (-?%d+)",
  })[op]
  return function(q) return { q:match(regexp), q:gsub(regexp, "") } end
end
return {
  answer = function(question)
    local prefix = "^What is "
    local first = "^(-?%d+)"
    question = question:gsub(prefix, "")
    local result = tonumber(question:match(first))
    question = question:gsub(first, "")
    while question ~= "?" do
      local add, sub = m([[add]])(question), m([[sub]])(question)
      local mul, div = m([[mul]])(question), m([[div]])(question)
      if add[1] then
        result, question = result + tonumber(add[1]), add[2]
      elseif sub[1] then
        result, question = result - tonumber(sub[1]), sub[2]
      elseif mul[1] then
        result, question = result * tonumber(mul[1]), mul[2]
      elseif div[1] then
        result, question = result / tonumber(div[1]), div[2]
      else
        error("Invalid question")
      end
    end
    return result
  end
}
