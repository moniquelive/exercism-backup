local function isPalindrome(n)
	local s = tostring(n)
	return s == s:reverse()
end

local memo = {}
local function all(min, max)
	assert(min <= max, "min must be <= max")
	if memo[min] and memo[min][max] then return memo[min][max] end
	local retval = {}
	for i = min, max do
		for j = i, max do
			local p = i * j
			if isPalindrome(p) then
				retval[p] = retval[p] or {}
				table.insert(retval[p], { i, j })
			end
		end
	end
	memo[min] = memo[min] or {}
	memo[min][max] = retval
	return retval
end

local function smallest(min, max)
	local r = all(min, max)
	local m = math.huge
	for k in pairs(r) do
		m = math.min(m, k)
	end
	if m == math.huge then return { value = nil, factors = {} } end
	return { value = m, factors = r[m] }
end

local function largest(min, max)
	local r = all(min, max)
	local m = 0
	for k in pairs(r) do
		m = math.max(m, k)
	end
	if m == 0 then return { value = nil, factors = {} } end
	return { value = m, factors = r[m] }
end

return { smallest = smallest, largest = largest }
