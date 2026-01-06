local function tosortedtable(s)
	local t = setmetatable({}, { __index = table })
	for i = 1, s:len() do
		t:insert(s:sub(i, i))
	end
	t:sort()
	return t
end
local function equal(a, b)
	assert(#a == #b)
	for i = 1, #a do
		if a[i] ~= b[i] then return false end
	end
	return true
end
local Anagram = {
	new = function(self, word)
		self.orig_word = word:lower()
		self.word = tosortedtable(self.orig_word)
		return self
	end,
	match = function(self, candidates)
		local retval = setmetatable({}, { __index = table })
		for _, c in ipairs(candidates) do
			if c:lower() ~= self.orig_word then
				local t = tosortedtable(c:lower())
				if #self.word == #t and equal(self.word, t) then retval:insert(c) end
			end
		end
		return retval
	end,
}
return Anagram
