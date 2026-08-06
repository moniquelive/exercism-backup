local Complex
Complex = function(r, i)
	local e, c = math.exp(1), { r = r or 0, i = i or 0 }
	function c.abs() return math.sqrt(r ^ 2 + i ^ 2) end
	function c.conj() return Complex(r, -i) end
	function c.exp() return Complex(e ^ r * math.cos(i), e ^ r * math.sin(i)) end
	return setmetatable(c, {
		__eq = function(a, b) return math.abs(a.r - b.r) < 1e-15 and math.abs(a.i - b.i) < 1e-15 end,
		__add = function(a, b) return Complex(a.r + b.r, a.i + b.i) end,
		__sub = function(a, b) return Complex(a.r - b.r, a.i - b.i) end,
		__mul = function(a, b) return Complex(a.r * b.r - a.i * b.i, a.i * b.r + a.r * b.i) end,
		__div = function(a, b)
			return Complex((a.r * b.r + a.i * b.i) / (b.r ^ 2 + b.i ^ 2), (a.i * b.r - a.r * b.i) / (b.r ^ 2 + b.i ^ 2))
		end,
	})
end
return Complex
