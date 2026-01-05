local function win(s, v)
	local positions = {
		("^%s%s%s......"):format(v, v, v), -- lines (1,2,3)
		("^...%s%s%s..."):format(v, v, v), --    (4,5,6)
		("^......%s%s%s"):format(v, v, v), -- (7,8,9)
		("^%s..%s..%s.."):format(v, v, v), -- cols (1,4,7)
		("^.%s..%s..%s."):format(v, v, v), --      (2,5,8)
		("^..%s..%s..%s"):format(v, v, v), --      (3,6,9)
		("^%s...%s...%s"):format(v, v, v), -- diags (1,5,9)
		("^..%s.%s.%s.."):format(v, v, v), --       (3,5,7)
	}
	for _, p in ipairs(positions) do -- any match
		if s:match(p) then return true end
	end
	return false
end
return {
	gamestate = function(board)
		local flat = table.concat(board)
		local _, countX = flat:gsub("X", "")
		local _, countO = flat:gsub("O", "")
		local winX = win(flat, "X")
		local winO = win(flat, "O")

		assert(countX >= countO)
		if countX > 1 then assert(countO > 0) end
		if winX then assert(countX > countO) end
		if winO then assert(countO >= countX) end

		if winX or winO then return "win" end
		if not flat:match(" ") then return "draw" end
		return "ongoing"
	end,
}
