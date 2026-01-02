return function(n)
	local rows = {}
	for row = 1, n do
		local r = {}
		for i = 1, row do
			if i == 1 or i == row then
				r[i] = 1
			else
				r[i] = rows[row - 1][i - 1] + rows[row - 1][i]
			end
		end
		rows[row] = r
	end

	return {
		rows = rows,
		last_row = rows[#rows],
	}
end
