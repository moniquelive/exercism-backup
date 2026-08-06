local function chunked(s, size)
	size = assert(tonumber(size), "size must be a number")
	assert(size > 0, "size must be > 0")
	local out = {}
	for i = 1, #s, size do
		out[#out + 1] = s:sub(i, i + size - 1)
	end
	return out
end

local function pad_to_len(s, r)
	s = tostring(s)
	local n = #s
	if n >= r then return s:sub(1, r) end
	return s .. string.rep(" ", r - n) -- right-pad
end

local function transpose_chunks(rows, cols)
	local out = {}
	for c = 1, cols do
		local col = {}
		for r = 1, #rows do
			local ch = rows[r]:sub(c, c)
			col[#col + 1] = (ch ~= "" and ch) or " "
		end
		out[c] = table.concat(col)
	end
	return out
end

return {
	ciphertext = function(plaintext)
		local s = (plaintext:lower():gsub("%W", ""))
		if s == "" then return "" end

		local n = #s
		local c = math.ceil(math.sqrt(n))
		local r = math.ceil(n / c)

		local rows = chunked(s, c)
		local cols = transpose_chunks(rows, c)

		for i = 1, #cols do
			cols[i] = pad_to_len(cols[i], r)
		end

		return table.concat(cols, " ")
	end,
}
