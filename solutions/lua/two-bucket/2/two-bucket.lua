local function gcd(a, b) return b == 0 and a or gcd(b, a % b) end

local function neighbors(a, b, cap1, cap2)
	local pour12 = math.min(a, cap2 - b)
	local pour21 = math.min(b, cap1 - a)
	return {
		{ cap1, b }, -- fill 1
		{ a, cap2 }, -- fill 2
		{ 0, b }, -- empty 1
		{ a, 0 }, -- empty 2
		{ a - pour12, b + pour12 }, -- pour 1 -> 2
		{ a + pour21, b - pour21 }, -- pour 2 -> 1
	}
end

return {
	measure = function(args)
		local cap1, cap2 = args.bucket_one_capacity, args.bucket_two_capacity
		local goal = args.goal_volume
		local start_bucket = args.start_bucket
		if type(start_bucket) == "string" then start_bucket = ({ one = 1, two = 2 })[start_bucket] end
		if not start_bucket then error("invalid start bucket") end

		-- Quick impossibility checks (optional but nice)
		if goal > math.max(cap1, cap2) or goal % gcd(cap1, cap2) ~= 0 then error("impossible") end

		local function result(moves, bucket, other)
			return {
				moves = moves,
				goal_bucket_number = bucket,
				other_bucket_volume = other,
			}
		end

		local function key(a, b) return a .. ":" .. b end

		-- initial state (counts as 1 move)
		local start_a, start_b = start_bucket == 1 and cap1 or 0, start_bucket == 2 and cap2 or 0

		-- If first fill already hits goal
		if start_a == goal then return result(1, 1, start_b) end
		if start_b == goal then return result(1, 2, start_a) end

		-- BFS queue
		local q = { { start_a, start_b, 1 } }
		local head = 1
		local seen = { [key(start_a, start_b)] = true }

		while head <= #q do
			local a, b, moves = q[head][1], q[head][2], q[head][3]
			head = head + 1

			for _, nxt in ipairs(neighbors(a, b, cap1, cap2)) do
				local na, nb = nxt[1], nxt[2]

				local is_forbidden = (start_bucket == 1 and na == 0 and nb == cap2)
					or (start_bucket == 2 and nb == 0 and na == cap1)

				if not is_forbidden then
					local k = key(na, nb)
					if not seen[k] then
						local nmoves = moves + 1

						if na == goal then return result(nmoves, 1, nb) end
						if nb == goal then return result(nmoves, 2, na) end

						seen[k] = true
						q[#q + 1] = { na, nb, nmoves }
					end
				end
			end
		end

		error("impossible")
	end,
}
