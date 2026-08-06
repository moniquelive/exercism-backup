local Weekday = { "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" }
return function(dt)
	local order = { first = 1, second = 2, third = 3, fourth = 4 }
	local days_set = {}
	local days = {}
	for day = 1, 31 do
		local tt = os.date("*t", os.time({ year = dt.year, month = dt.month, day = day }))
		if Weekday[tt.wday] == dt.day and not days_set[tt.day] then
			days_set[tt.day] = true
			days[#days + 1] = tt.day
		end
	end
	if dt.week == "last" then return days[#days] end
	if dt.week == "teenth" then
		for i = 13, 19 do
			if days_set[i] then return i end
		end
	end
	return days[order[dt.week]]
end
