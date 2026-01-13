local units = {
	"zero",
	"one",
	"two",
	"three",
	"four",
	"five",
	"six",
	"seven",
	"eight",
	"nine",
	"ten",
	"eleven",
	"twelve",
	"thirteen",
	"fourteen",
	"fifteen",
	"sixteen",
	"seventeen",
	"eighteen",
	"nineteen",
}
local tens = { "", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety" }
local label_for = {
	[10] = "",
	[100] = " hundred",
	[1000] = " thousand",
	[1000000] = " million",
	[1000000000] = " billion",
}

local function speak(number)
	local function go(base)
		local div, mod = number // base, number % base
		local begin = (base == 10) and tens[div + 1] or speak(div)
		local prefixLabel = label_for[base] or ""
		local suffix = (mod == 0) and "" or ((base == 10) and "-" or " ") .. speak(mod)
		return begin .. prefixLabel .. suffix
	end
	if number >= 0 and number < 20 then return units[number + 1] end
	if number >= 20 and number < 100 then return go(10) end
	if number >= 100 and number < 1000 then return go(100) end
	if number >= 1000 and number < 1000000 then return go(1000) end
	if number >= 1000000 and number < 1000000000 then return go(1000000) end
	if number >= 1000000000 and number < 1000000000000 then return go(1000000000) end
	return "not a number"
end
return function(n)
	if type(n) ~= "number" or n % 1 ~= 0 then return -1 end
	if n < 0 or n >= 1000000000000 then return -1 end
	return speak(n)
end
