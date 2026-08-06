return function(config)
	assert(config.digits:match("^%d+$"))
	assert(0 < config.span and config.span <= #config.digits)

	local maxProd = 0
	for i = 1, #config.digits - config.span + 1 do
		local window = config.digits:sub(i, i + config.span - 1)
		local prod = 1
		for j = 1, #window do
			prod = prod * tonumber(window:sub(j, j))
		end
		maxProd = math.max(maxProd, prod)
	end
	return maxProd
end
