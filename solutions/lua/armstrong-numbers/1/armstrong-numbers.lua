local ArmstrongNumbers = {}

function ArmstrongNumbers.is_armstrong_number(number)
	local sum, exp = 0, math.floor(math.log10(number) + 1)

	local i = number
	while i ~= 0 do
		sum, i = sum + ((i % 10) ^ exp), i // 10
	end
	return sum == number
end

return ArmstrongNumbers
