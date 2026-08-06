local react = {}

function react.Reactor()
	local reactor = {}

	local function collect_dependents(start_cells)
		local queue, seen, ordered = {}, {}, {}
		for _, cell in ipairs(start_cells) do
			for _, dep in ipairs(cell.dependents) do
				queue[#queue + 1] = dep
			end
		end
		local i = 1
		while i <= #queue do
			local cell = queue[i]
			i = i + 1
			if not seen[cell] then
				seen[cell] = true
				ordered[#ordered + 1] = cell
				for _, dep in ipairs(cell.dependents) do
					queue[#queue + 1] = dep
				end
			end
		end
		return ordered
	end

	local function depth_of(cell, memo)
		if memo[cell] then return memo[cell] end
		if cell.kind == "input" then
			memo[cell] = 0
			return 0
		end
		local max_depth = 0
		for _, dep in ipairs(cell.deps) do
			local depth = depth_of(dep, memo)
			if depth > max_depth then max_depth = depth end
		end
		memo[cell] = max_depth + 1
		return memo[cell]
	end

	local function propagate_from(start_cells)
		local affected = collect_dependents(start_cells)
		if #affected == 0 then return end

		local depths = {}
		for _, cell in ipairs(affected) do
			depth_of(cell, depths)
		end
		table.sort(affected, function(a, b) return depths[a] < depths[b] end)

		local changed = {}
		for _, cell in ipairs(affected) do
			local args = {}
			for i, dep in ipairs(cell.deps) do
				args[i] = dep.value
			end
			local value = cell.compute(table.unpack(args))
			if value ~= cell.value then
				cell.value = value
				changed[#changed + 1] = cell
			end
		end

		for _, cell in ipairs(changed) do
			for callback, _ in pairs(cell.callbacks) do
				callback(cell.value)
			end
		end
	end

	function reactor.InputCell(initial)
		local cell = { kind = "input", value = initial, dependents = {} }

		function cell.get_value() return cell.value end

		function cell.set_value(value)
			if value == cell.value then return end
			cell.value = value
			propagate_from({ cell })
		end

		return cell
	end

	function reactor.ComputeCell(...)
		local deps = { ... }
		local compute = deps[#deps]
		deps[#deps] = nil

		local cell = {
			kind = "compute",
			deps = deps,
			compute = compute,
			dependents = {},
			callbacks = {},
		}

		for _, dep in ipairs(deps) do
			dep.dependents[#dep.dependents + 1] = cell
		end

		local args = {}
		for i, dep in ipairs(deps) do
			args[i] = dep.value
		end
		cell.value = compute(table.unpack(args))

		function cell.get_value() return cell.value end
		function cell.watch(callback) cell.callbacks[callback] = true end
		function cell.unwatch(callback) cell.callbacks[callback] = nil end
		return cell
	end

	return reactor
end

return react
