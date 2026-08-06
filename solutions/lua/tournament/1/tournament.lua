local function sorted(t)
	local retval = {}
	for k, v in pairs(t) do
		v.name = k
		retval[#retval + 1] = v
	end
	local function sort_fn(a, b) return a.p == b.p and a.name < b.name or a.p > b.p end
	table.sort(retval, sort_fn)
	return retval
end
local function formatted(t)
	local retval = { "Team                           | MP |  W |  D |  L |  P" }
	for _, r in ipairs(t) do
		local line = string.format("%-30s | %2d | %2d | %2d | %2d | %2d", r.name, r.mp, r.w, r.d, r.l, r.p)
		table.insert(retval, line)
	end
	return retval
end
return function(results)
	local data = {}
	for _, r in ipairs(results) do
		local team1, team2, result = r:match("^([^;]+);([^;]+);([^;]+)$")
		if team1 ~= nil and team2 ~= nil and (result == "win" or result == "draw" or result == "loss") then
			data[team1] = data[team1] or { mp = 0, w = 0, d = 0, l = 0, p = 0 }
			data[team2] = data[team2] or { mp = 0, w = 0, d = 0, l = 0, p = 0 }
			data[team1].mp = data[team1].mp + 1
			data[team2].mp = data[team2].mp + 1
			if result == "draw" then
				data[team1].d = data[team1].d + 1
				data[team1].p = data[team1].p + 1
				data[team2].d = data[team2].d + 1
				data[team2].p = data[team2].p + 1
			else
				if result == "loss" then
					team1, team2 = team2, team1
				end
				data[team1].w = data[team1].w + 1
				data[team1].p = data[team1].p + 3
				data[team2].l = data[team2].l + 1
			end
		end
	end
	return formatted(sorted(data))
end
