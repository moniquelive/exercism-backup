local function win(s, v)
	local positions = {
		("^%s%s%s......"):format(v, v, v),
		("^...%s%s%s..."):format(v, v, v),
		("^......%s%s%s"):format(v, v, v),
		("^%s...%s...%s"):format(v, v, v),
		("^..%s.%s.%s.."):format(v, v, v),
		("%s..%s..%s"):format(v, v, v),
	}
	for _, p in ipairs(positions) do -- any match
		if s:match(p) then return true end
	end
end
return {
	gamestate = function(board)
		local flat = table.concat(board)
		local countX = select(2, flat:gsub("X", ""))
		local countO = select(2, flat:gsub("O", ""))
		local winX = win(flat, "X")
		local winO = win(flat, "O")

		assert(countX >= countO)
		if countX > 1 then assert(countO > 0) end
		if winX then assert(countX > countO) end
		if winO then assert(countO >= countX) end

		if winX or winO then return "win" end
		return countX + countO == 9 and "draw" or "ongoing"
	end,
}
