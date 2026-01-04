local function gcd(a, b) return b == 0 and a or gcd(b, a % b) end

local function reduce(a)
	local gcf = gcd(a[1], a[2])
	return { a[1] // gcf, a[2] // gcf }
end

local function add(a, b) return reduce({ a[1] * b[2] + b[1] * a[2], a[2] * b[2] }) end
local function subtract(a, b) return reduce({ a[1] * b[2] - b[1] * a[2], a[2] * b[2] }) end
local function multiply(a, b) return reduce({ a[1] * b[1], a[2] * b[2] }) end
local function divide(a, b) return reduce({ a[1] * b[2], a[2] * b[1] }) end
local function abs(a) return reduce({ math.abs(a[1]), math.abs(a[2]) }) end
local function exp_rational(a, p) return p < 0 and reduce({ a[2] ^ -p, a[1] ^ -p }) or reduce({ a[1] ^ p, a[2] ^ p }) end
local function exp_real(p, a) return p ^ (a[1] / a[2]) end

return {
	add = add,
	subtract = subtract,
	multiply = multiply,
	divide = divide,
	abs = abs,
	exp_rational = exp_rational,
	exp_real = exp_real,
	reduce = reduce,
}
