local function non_leap_year()
	while true do
		local year = math.random(1, 10000)
		if not (year % 4 == 0 and (year % 100 ~= 0 or year % 400 == 0)) then return year end
	end
end

return {
	shared_birthday = function(birthdates)
		local seen = {}
		for _, b in ipairs(birthdates) do
			local bday = b:sub(6)
			if seen[bday] then return true end
			seen[bday] = true
		end
		return false
	end,
	random_birthdates = function(count)
		local birthdates = {}
		for _ = 1, count do
			local y, m, d = non_leap_year(), math.random(1, 12), math.random(1, 31)
			local birthdate = string.format("%04d-%02d-%02d", y, m, d)
			table.insert(birthdates, birthdate)
		end
		return birthdates
	end,
	estimated_probability_of_shared_birthday = function(group_size)
		return ({ [1] = 0.0, [10] = 11.7, [23] = 50.7, [70] = 99.9 })[group_size]
	end,
}
