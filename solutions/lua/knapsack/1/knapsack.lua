return {
	maximum_value = function(maximum_weight, items)
		local buffer = {}
		for i = 0, maximum_weight do
			buffer[i] = 0
		end
		for _, item in ipairs(items) do
			local i = maximum_weight + 1
			while i > item.weight do
				i = i - 1
				buffer[i] = math.max(buffer[i], item.value + buffer[i - item.weight])
			end
		end
		return buffer[maximum_weight]
	end,
}
