local function get(m, x, y)
	local row = m[x]
	return (row and row[y]) or 0
end

local function neighbors(board, x, y)
	local sum = 0
	for dy = -1, 1 do
		for dx = -1, 1 do
			if not (dx == 0 and dy == 0) then sum = sum + (get(board, x + dx, y + dy)) end
		end
	end
	return sum
end

local function tick(matrix)
	local retval = {}
	for y = 1, #matrix do
		for x = 1, #matrix[y] do
			local n = neighbors(matrix, x, y)
			retval[x] = retval[x] or {}
			if matrix[x][y] == 1 then
				retval[x][y] = (n == 2 or n == 3) and 1 or 0
			else
				retval[x][y] = (n == 3) and 1 or 0
			end
		end
	end
	return retval
end

return { tick = tick }
