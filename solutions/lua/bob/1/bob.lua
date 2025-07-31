return {
  hey = function(say)
    say = say:gsub("%s+$", "") -- trim end
    local is_question = say:match("?$")
    local is_shout = say:match('[A-Z]') and not say:match('[a-z]')
    if #say == 0 then return "Fine. Be that way!" end
    if is_question and is_shout then return "Calm down, I know what I'm doing!" end
    if is_question then return "Sure." end
    if is_shout then return "Whoa, chill out!" end
    return "Whatever."
  end
}
