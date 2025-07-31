local leap_year = function(number)
	local by400 = (number % 400) == 0
	local by4 = (number % 4) == 0
	local by100 = (number % 100) == 0
	return by400 or (by4 and not by100)
end

return leap_year
