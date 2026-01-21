local deltas = { { -1, -1 }, { -1, 0 }, { -1, 1 }, { 0, -1 }, { 0, 1 }, { 1, -1 }, { 1, 0 }, { 1, 1 } }
local function neighbors(garden, i, j)
	local n = 0
	for _, d in ipairs(deltas) do
		local row = garden[j + d[2]] or ""
		if row:sub(i + d[1], i + d[1]) == "*" then n = n + 1 end
	end
	return n == 0 and " " or tostring(n)
end
return {
	annotate = function(garden)
		local result = {}
		for j, row in ipairs(garden) do
			local out = {}
			for i = 1, #row do
				local ch = row:sub(i, i)
				out[i] = (ch == " ") and neighbors(garden, i, j) or ch
			end
			result[#result + 1] = table.concat(out)
		end
		return result
	end,
}
