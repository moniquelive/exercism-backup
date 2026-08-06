return {
	encode = function(s)
		return s:gsub("((%a)(%a*%2))", function(count, ch) return #count .. ch end)
	end,
	decode = function(s)
		return s:gsub("(%d+)(.)", function(n, ch) return ch:rep(n) end)
	end,
}
