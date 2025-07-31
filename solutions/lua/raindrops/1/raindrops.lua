return function(n)
  ret = ""
  if n % 3 == 0 then ret = "Pling" end
  if n % 5 == 0 then ret = ret .. "Plang" end
  if n % 7 == 0 then ret = ret .. "Plong" end
  if ret == "" then return tostring(n) else return ret end
end
