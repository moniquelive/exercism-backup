return {
	pov_from = function(node_name)
		local function clone(node)
			local children = node[2]
			if not children then return { node[1] } end
			local out = {}
			for i = 1, #children do
				out[i] = clone(children[i])
			end
			return { node[1], out }
		end

		local function path(node, target)
			if node[1] == target then return { node } end
			local children = node[2]
			if not children then return nil end
			for i = 1, #children do
				local p = path(children[i], target)
				if p then
					table.insert(p, 1, node)
					return p
				end
			end
		end

		local function reparent(p, i)
			local node = p[i]
			local children = node[2]
			local out = {}
			if children then
				local exclude = p[i + 1]
				for c = 1, #children do
					if children[c] ~= exclude then out[#out + 1] = clone(children[c]) end
				end
			end
			if i > 1 then out[#out + 1] = reparent(p, i - 1) end
			return #out == 0 and { node[1] } or { node[1], out }
		end

		return {
			of = function(tree)
				local p = assert(path(tree, node_name), "node not found")
				return reparent(p, #p)
			end,
		}
	end,
	path_from = function(source)
		local function path(node, target)
			if node[1] == target then return { node[1] } end
			local children = node[2]
			if not children then return nil end
			for i = 1, #children do
				local p = path(children[i], target)
				if p then
					table.insert(p, 1, node[1])
					return p
				end
			end
		end

		return {
			to = function(destination)
				return {
					of = function(tree)
						local sp = path(tree, source)
						local dp = path(tree, destination)
						assert(sp and dp, "node not found")
						local i = 1
						while sp[i] == dp[i] do
							i = i + 1
						end
						local out = {}
						for j = #sp, i - 1, -1 do
							out[#out + 1] = sp[j]
						end
						for j = i, #dp do
							out[#out + 1] = dp[j]
						end
						return out
					end,
				}
			end,
		}
	end,
}
