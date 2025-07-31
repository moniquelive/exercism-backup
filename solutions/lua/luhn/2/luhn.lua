return {
	valid = function(s)
		s = s:gsub("%s", "")
		if s:gsub("%d", "") ~= "" then
			return false
		end
		s = s:gsub("%D", "")
		if #s < 2 then
			return false
		end
		local sum, rev = 0, s:reverse()
		for i = 1, #rev, 2 do
			local odd = tonumber(rev:sub(i, i))
			local even = 2 * (tonumber(rev:sub(i + 1, i + 1)) or 0)
			if even > 9 then
				even = even - 9
			end
			sum = sum + even + odd
		end
		return sum % 10 == 0
	end,
}
