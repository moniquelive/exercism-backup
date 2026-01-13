local function encode(plaintext, rail_count)
	local result, delta, rail = {}, 1, 1
	for ch in plaintext:gmatch(".") do
		if rail < 1 then
			rail, delta = 2, 1
		end
		if rail > rail_count then
			rail, delta = rail_count - 1, -1
		end
		result[rail] = (result[rail] or "") .. ch
		rail = rail + delta
	end
	return table.concat(result)
end

local function table_of_spaces(n)
	local result = {}
	for _ = 1, n do
		table.insert(result, " ")
	end
	return result
end
local function decode(ciphertext, rail_count)
	local map, delta, rail = {}, 1, 1
	for i = 1, ciphertext:len() do
		if rail < 1 then
			rail, delta = 2, 1
		end
		if rail > rail_count then
			rail, delta = rail_count - 1, -1
		end
		map[rail] = map[rail] or table_of_spaces(80)
		map[rail][i] = "*"
		rail = rail + delta
	end
	local j = 1
	for rail = 1, rail_count do
		for i = 1, #map[rail] do
			if map[rail][i] == "*" then
				map[rail][i] = ciphertext:sub(j, j)
				j = j + 1
			end
		end
	end
	local result = ""
	delta, rail = 1, 1
	for i = 1, ciphertext:len() do
		if rail < 1 then
			rail, delta = 2, 1
		end
		if rail > rail_count then
			rail, delta = rail_count - 1, -1
		end
		result = result .. map[rail][i]
		rail = rail + delta
	end
	return result
end

return { encode = encode, decode = decode }
