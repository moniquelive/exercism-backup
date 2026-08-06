local Set
Set = function(...)
	local s = { d = {} }
	for _, k in ipairs({ ... } or {}) do
		s.d[k] = true
	end
	function s.add(self, x) self.d[x] = true end
	function s.equals(self, other) return #self.d == #other.d and self:is_subset(other) end
	function s.is_empty(self) return #self.d == 0 end
	function s.contains(self, x) return self.d[x] ~= nil end
	function s.is_subset(self, other)
		for k in pairs(self.d) do
			if other.d[k] == nil then return false end
		end
		return true
	end
	function s.is_disjoint(self, other)
		for k in pairs(self.d) do
			if other.d[k] ~= nil then return false end
		end
		return true
	end
	function s.intersection(self, other)
		local retval = Set()
		for k in pairs(self.d) do
			if other.d[k] ~= nil then retval:add(k) end
		end
		return retval
	end
	function s.difference(self, other)
		local retval = Set()
		for k in pairs(self.d) do
			if other.d[k] == nil then retval:add(k) end
		end
		return retval
	end
	function s.union(self, other)
		local retval = self
		for k in pairs(other.d) do
			retval:add(k)
		end
		return retval
	end
	return s
end
return Set
