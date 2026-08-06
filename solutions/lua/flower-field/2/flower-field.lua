return {
	annotate = function(garden)
		local function neighbors(i, j)
			local acc = ""
			for _, d in ipairs({ { -1, -1 }, { -1, 0 }, { -1, 1 }, { 0, -1 }, { 0, 1 }, { 1, -1 }, { 1, 0 }, { 1, 1 } }) do
				local row = garden[j + d[2]] or ""
				acc = acc .. row:sub(i + d[1], i + d[1])
			end
			local n = select(2, acc:gsub("%*", ""))
			return n == 0 and " " or tostring(n)
		end
		for j, row in ipairs(garden) do
			local out = {}
			for i = 1, #row do
				local ch = row:sub(i, i)
				out[i] = (ch == " ") and neighbors(i, j) or ch
			end
			garden[j] = table.concat(out)
		end
		return garden
	end,
}
