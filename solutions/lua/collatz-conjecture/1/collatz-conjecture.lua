local function count(n, steps)
	assert(n > 0, "Only positive numbers are allowed")

	if n == 1 then
		return steps
	elseif n % 2 == 1 then
		return count(3 * n + 1, steps + 1)
	elseif n > 0 and n % 2 == 0 then
		return count(n // 2, steps + 1)
	end
end

return function(n)
	return count(n, 0)
end
