local Set = {}
Set.__index = Set
local function foreach(t, f)
	for k in pairs(t) do
		if f(k) then return false end
	end
	return true
end
function Set:add(x) self[x] = true end
function Set:contains(x) return self[x] ~= nil end
function Set:equals(other) return other:is_subset(self) and self:is_subset(other) end
function Set:is_empty() return next(self) == nil end
function Set:is_subset(other)
	return foreach(self, function(k) return other[k] == nil end)
end
function Set:is_disjoint(other)
	return foreach(self, function(k) return other[k] ~= nil end)
end
function Set:union(other)
	return foreach(other, function(k) self:add(k) end) and self
end
function Set:intersection(other)
	return foreach(self, function(k)
		if not other:contains(k) then self[k] = nil end
	end) and self
end
function Set:difference(other)
	return foreach(self, function(k)
		if other:contains(k) then self[k] = nil end
	end) and self
end
function Set.new(...)
	local s = {}
	for _, k in ipairs({ ... } or {}) do
		s[k] = true
	end
	return setmetatable(s, Set)
end
return Set.new
