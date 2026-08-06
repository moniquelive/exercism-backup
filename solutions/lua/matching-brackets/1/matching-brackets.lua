return {
	valid = function(s)
		local stack = setmetatable({}, { __index = table })
		for ch in s:gmatch(".") do
			if ch == "(" then stack:insert(")") end
			if ch == "[" then stack:insert("]") end
			if ch == "{" then stack:insert("}") end
			if ch:match("[)%]}]") and stack:remove() ~= ch then return false end
		end
		return #stack == 0
	end,
}
