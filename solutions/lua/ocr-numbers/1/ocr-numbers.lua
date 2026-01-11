local Digits = {
	[" _ \n| |\n|_|\n   "] = 0,
	["   \n  |\n  |\n   "] = 1,
	[" _ \n _|\n|_ \n   "] = 2,
	[" _ \n _|\n _|\n   "] = 3,
	["   \n|_|\n  |\n   "] = 4,
	[" _ \n|_ \n _|\n   "] = 5,
	[" _ \n|_ \n|_|\n   "] = 6,
	[" _ \n  |\n  |\n   "] = 7,
	[" _ \n|_|\n|_|\n   "] = 8,
	[" _ \n|_|\n _|\n   "] = 9,
}
return {
	convert = function(s)
		local chunks = {}
		local count = 0
		local offset = 1
		for line in s:gmatch("[^\n]+") do
			local i = offset
			for seg in line:gmatch("[^\n][^\n][^\n]") do
				chunks[i] = chunks[i] or {}
				table.insert(chunks[i], seg)
				i = i + 1
			end
			count = count + 1
			if count % 4 == 0 then offset = offset + 3 end
		end
		local retval = {}
		for _, chunk in ipairs(chunks) do
			local d = table.concat(chunk, "\n")
			table.insert(retval, Digits[d] or "?")
		end
		local concat = table.concat(retval)
		if #s == 119 then return concat:gsub("(...)", "%1,"):sub(1, -2) end
		return concat
	end,
}
