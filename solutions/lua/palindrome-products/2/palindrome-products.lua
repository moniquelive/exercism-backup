local function isPalindrome(n)
	local s = tostring(n)
	return s == s:reverse()
end

local function smallest(min, max)
	assert(min <= max, "min must be <= max")
	for i = min * min, max * max do
		if isPalindrome(i) then
			local factors = {}
			for j = min, math.floor(math.sqrt(i)) do
				if i % j == 0 then
					local k = math.floor(i / j)
					if k >= min and k <= max then table.insert(factors, { j, k }) end
				end
			end
			if #factors > 0 then return { value = i, factors = factors } end
		end
	end
	return { value = nil, factors = {} }
end

local function largest(min, max)
	assert(min <= max, "min must be <= max")
	for i = max * max, min * min, -1 do
		if isPalindrome(i) then
			local factors = {}
			for j = min, math.floor(math.sqrt(i)) do
				if i % j == 0 then
					local k = math.floor(i / j)
					if k >= min and k <= max then table.insert(factors, { j, k }) end
				end
			end
			if #factors > 0 then return { value = i, factors = factors } end
		end
	end
	return { value = nil, factors = {} }
end

return { smallest = smallest, largest = largest }
