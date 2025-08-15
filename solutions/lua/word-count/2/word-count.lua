return {
  count_words =
      function(s)
        local res = {}
        for w in s:lower():gmatch("[%w']+") do
          local t = w:match("^'?(.-)'?$")
          if t:len() > 0 then res[t] = (res[t] or 0) + 1 end
        end
        return res
      end

}
