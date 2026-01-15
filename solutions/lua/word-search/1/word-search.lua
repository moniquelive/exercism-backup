local deltas = { { -1, -1 }, { 0, -1 }, { 1, -1 }, { -1, 0 }, { 1, 0 }, { -1, 1 }, { 0, 1 }, { 1, 1 } }
return function(grid)
	local function find(x, y, delta, word)
		for i = 1, word:len() do
			if (not grid[y]) or (word:sub(i, i) ~= grid[y]:sub(x, x)) then return false end
			x = x + delta[1]
			y = y + delta[2]
		end
		return true
	end
	return {
		search = function(words)
			local result = {}
			for _, word in ipairs(words) do
				for y = 1, #grid do
					for x = 1, #grid[y] do
						for _, delta in ipairs(deltas) do
							if find(x, y, delta, word) then
								result[word] = { start = { x, y } }
								if delta[1] == -1 and delta[2] == -1 then
									result[word]["end"] = { x - word:len() + 1, y - word:len() + 1 }
								elseif delta[1] == -1 and delta[2] == 1 then
									result[word]["end"] = { x - word:len() + 1, y + word:len() - 1 }
								elseif delta[1] == 1 and delta[2] == -1 then
									result[word]["end"] = { x + word:len() - 1, y - word:len() + 1 }
								elseif delta[1] == 1 and delta[2] == 1 then
									result[word]["end"] = { x + word:len() - 1, y + word:len() - 1 }
								elseif delta[1] == -1 then
									result[word]["end"] = { x - word:len() + 1, y }
								elseif delta[2] == -1 then
									result[word]["end"] = { x, y - word:len() + 1 }
								elseif delta[2] == 1 then
									result[word]["end"] = { x, y + word:len() - 1 }
								else
									result[word]["end"] = { x + word:len() - 1, y }
								end
							end
						end
					end
				end
			end
			return result
		end,
	}
end
