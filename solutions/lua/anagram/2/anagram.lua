local function sort(s)
	local t = {}
	for ch in s:lower():gmatch(".") do
		table.insert(t, ch)
	end
	table.sort(t)
	return table.concat(t)
end

local Anagram = {}
Anagram.__index = Anagram

function Anagram:new(word)
	return setmetatable({
		word = word:lower(),
		sorted = sort(word:lower()),
	}, Anagram)
end

function Anagram:match(candidates)
	local retval = setmetatable({}, { __index = table })
	for _, c in ipairs(candidates) do
		if c:lower() ~= self.word and self.sorted == sort(c) then retval:insert(c) end
	end
	return retval
end

return Anagram
