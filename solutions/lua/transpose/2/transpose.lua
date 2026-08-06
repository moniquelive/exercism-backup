return function(s)
	local result, pad = {}, 0
	for line in s:gmatch("[^\n]*") do
		for i, ch in line:gmatch("()(.)") do
			result[i] = result[i] or ""
			result[i] = result[i] .. string.rep(" ", pad - result[i]:len()) .. ch
		end
		pad = pad + 1
	end
	return table.concat(result, "\n")
end
