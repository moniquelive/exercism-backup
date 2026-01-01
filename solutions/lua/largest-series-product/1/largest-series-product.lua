return function(config)
	assert(config.digits:match("^%d+$"))
	assert(0 < config.span and config.span <= #config.digits)

	local maxProd = 0
	local pat = ("."):rep(config.span)
	for i = 1, #config.digits do
		for window in config.digits:sub(i, i + config.span - 1):gmatch(pat) do
			local prod = 1
			for d in window:gmatch(".") do
				prod = prod * tonumber(d)
			end
			maxProd = math.max(maxProd, prod)
		end
	end
	return maxProd
end
