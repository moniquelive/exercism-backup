local triangle = {}

function triangle.kind(a, b, c)
	if a <= 0 or b <= 0 or c <= 0 then
		error("Input Error")
	elseif a + b < c or b + c < a or a + c < b then
		error("Input Error")
	elseif a == b and b == c and c == a then
		return "equilateral"
	elseif a == b or b == c or c == a then
		return "isosceles"
	elseif a ~= b and b ~= c and c ~= a then
		return "scalene"
	end
end

return triangle
