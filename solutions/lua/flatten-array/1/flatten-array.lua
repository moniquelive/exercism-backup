local function flatten(x, out)
	out = out or setmetatable({}, { __index = table })
	if type(x) ~= "table" then return out:insert(x) end
	for _, v in pairs(x) do
		flatten(v, out)
	end
	return out
end

return flatten
