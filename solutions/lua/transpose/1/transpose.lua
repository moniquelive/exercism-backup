local function split_lines(s)
	local t = {}
	for line in (s .. "\n"):gmatch("(.-)\n") do
		t[#t + 1] = line
	end
	return t
end

local function pad(t, i)
	i = i or 1
	if i > #t then return {} end
	local maxlen = 0
	for j = i + 1, #t do
		maxlen = math.max(maxlen, t[j]:len())
	end
	local head = t[i] .. string.rep(" ", maxlen - #t[i])
	local tail = pad(t, i + 1)
	return { head, table.unpack(tail) }
end

return function(s)
	local split = pad(split_lines(s))
	local maxlen = 0
	for _, line in ipairs(split) do
		maxlen = math.max(maxlen, line:len())
	end
	local retval = {}
	for i = 1, maxlen do
		for _, line in ipairs(split) do
			retval[i] = (retval[i] or "") .. line:sub(i, i)
		end
	end
	return table.concat(retval, "\n")
end
