return function(dt)
	local order = { first = 1, second = 2, third = 3, fourth = 4 }
	local days_set = {}
	local days = {}
	for d = 1, 31 do
		local tm = os.time({ year = dt.year, month = dt.month, day = d })
		local leap_year = ((dt.year % 400) == 0) or (((dt.year % 4) == 0) and not ((dt.year % 100) == 0))
		local isvalid = not (dt.month == 2 and not leap_year and d > 28)
		if os.date("%A", tm) == dt.day and isvalid then
			days[#days + 1] = d
			days_set[d] = true
		end
	end
	if dt.week == "last" then
		return days[#days]
	elseif dt.week == "teenth" then
		for i = 13, 19 do
			if days_set[i] then return i end
		end
	end
	return days[order[dt.week]]
end
