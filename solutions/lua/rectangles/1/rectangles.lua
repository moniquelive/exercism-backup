return {
	count = function(grid)
		if #grid == 0 then return 0 end

		local function char_at(row_index, col_index) return grid[row_index]:sub(col_index, col_index) or " " end
		local function horizontal_ok(row_index, left_col, right_col)
			local row_part = grid[row_index]:sub(left_col, right_col)
			return row_part:match("^%+[-+]*%+$") ~= nil
		end

		local function vertical_ok(col_index, top_row, bottom_row)
			local parts = { "+" }
			for row = top_row + 1, bottom_row - 1 do
				parts[#parts + 1] = char_at(row, col_index)
			end
			parts[#parts + 1] = "+"
			return table.concat(parts):match("^%+[|+]*%+$") ~= nil
		end

		local count = 0
		for top_row = 1, #grid do
			local top_line = grid[top_row] or ""
			for left_col = 1, #top_line do
				if char_at(top_row, left_col) == "+" then
					for right_col = left_col + 1, #top_line do
						if char_at(top_row, right_col) == "+" and horizontal_ok(top_row, left_col, right_col) then
							for bottom_row = top_row + 1, #grid do
								if
									char_at(bottom_row, left_col) == "+"
									and char_at(bottom_row, right_col) == "+"
									and horizontal_ok(bottom_row, left_col, right_col)
									and vertical_ok(left_col, top_row, bottom_row)
									and vertical_ok(right_col, top_row, bottom_row)
								then
									count = count + 1
								end
							end
						end
					end
				end
			end
		end
		return count
	end,
}
