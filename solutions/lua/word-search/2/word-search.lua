return function(grid)
	local deltas = { { -1, -1 }, { 0, -1 }, { 1, -1 }, { -1, 0 }, { 1, 0 }, { -1, 1 }, { 0, 1 }, { 1, 1 } }
	local function find(x, y, delta, word)
		for i = 1, word:len() do
			if (not grid[y]) or (word:sub(i, i) ~= grid[y]:sub(x, x)) then return false end
			x, y = x + delta[1], y + delta[2]
		end
		return true
	end
	return {
		search = function(words)
			local result = {}
			for _, word in ipairs(words) do -- foreach (word in words)
				for y = 1, #grid do -- for i in 1..#grid
					for x = 1, #grid[y] do -- for i in 1..#grid[1]
						for _, delta in ipairs(deltas) do -- foreach (delta in deltas)
							if find(x, y, delta, word) then
								result[word] = {
									start = { x, y },
									["end"] = {
										x + delta[1] * (word:len() - 1),
										y + delta[2] * (word:len() - 1),
									},
								}
							end
						end
					end
				end
			end
			return result
		end,
	}
end
