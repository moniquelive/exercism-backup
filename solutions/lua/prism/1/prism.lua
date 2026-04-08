local DOT_EPS = 1e-9
local LINE_EPS = 0.1
local DEG_TO_RAD = math.pi / 180

local function distance_on_ray(x, y, dx, dy, prism)
	local vx = prism.x - x
	local vy = prism.y - y
	local dot = vx * dx + vy * dy
	if dot <= DOT_EPS then return nil end

	local cross = vx * dy - vy * dx
	if math.abs(cross) > LINE_EPS then return nil end

	return dot
end

return {
	find_sequence = function(start, prisms)
		local x, y, angle = start.x, start.y, start.angle
		local sequence = {}

		while true do
			local radians = angle * DEG_TO_RAD
			local dx = math.cos(radians)
			local dy = math.sin(radians)

			local hit, best_distance
			for _, prism in ipairs(prisms) do
				local distance = distance_on_ray(x, y, dx, dy, prism)
				if distance and (not best_distance or distance < best_distance - DOT_EPS) then
					hit = prism
					best_distance = distance
				end
			end

			if not hit then break end

			sequence[#sequence + 1] = hit.id
			x, y = hit.x, hit.y
			angle = angle + hit.angle
		end

		return sequence
	end,
}
