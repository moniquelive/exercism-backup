return {
	valid = function(s)
		s = string.gsub(s, "%s", "")
		if string.gsub(s, "%d", "") ~= "" then
			return false
		end
		s = string.gsub(s, "%D", "")
		local l = string.len(s)
		if l < 2 then
			return false
		end
		local sum, rev = 0, string.reverse(s)
		for i = 1, l, 2 do
			local odd = tonumber(string.sub(rev, i, i)) or 0
			local even = 2 * (tonumber(string.sub(rev, i + 1, i + 1)) or 0)
			if even > 9 then
				even = even - 9
			end
			sum = sum + even + odd
		end
		return sum % 10 == 0
	end,
}
