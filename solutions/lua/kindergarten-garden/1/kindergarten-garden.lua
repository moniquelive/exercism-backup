return function(s)
	local all_plants = { C = "clover", G = "grass", R = "radishes", V = "violets" }
	local row1, row2 = s:match("(%w+)\n(%w+)")
	return {
		plants = function(child)
			local index = 2 * (child:byte() - 65) + 1
			return {
				all_plants[row1:sub(index, index)],
				all_plants[row1:sub(index + 1, index + 1)],
				all_plants[row2:sub(index, index)],
				all_plants[row2:sub(index + 1, index + 1)],
			}
		end,
	}
end
