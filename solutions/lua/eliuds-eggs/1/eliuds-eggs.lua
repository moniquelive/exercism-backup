local EliudsEggs = {}

function EliudsEggs.egg_count(number)
	local bits = 0
	while number ~= 0 do
		bits = bits + (number & 1)
		number = number >> 1
	end
	return bits
end

return EliudsEggs
