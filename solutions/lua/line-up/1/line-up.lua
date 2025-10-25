---@param n string
---@return string
local function ord(n)
	local exceptions = { ["11"] = "th", ["12"] = "th", ["13"] = "th" }
	local ordinals = { ["1"] = "st", ["2"] = "nd", ["3"] = "rd" }
	local suffix = exceptions[n:sub(-2)] or ordinals[n:sub(-1)] or "th"
	return ("%s%s"):format(n, suffix)
end

return {
	---@param name string
	---@param number number
	---@return string
	format = function(name, number)
		return ("%s, you are the %s customer we serve today. Thank you!"):format(name, ord(tostring(number)))
	end,
}
