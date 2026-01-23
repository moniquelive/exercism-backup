local react = {}

function react.Reactor()
	local function InputCell(value)
		local cell = { value = value, callbacks = {} }
		function cell.get_value() return cell.value end
		function cell.watch(callback) cell.callbacks[callback] = true end
		function cell.unwatch(callback) cell.callbacks[callback] = nil end
		function cell.set_value(new_value)
			if new_value == cell.value then return end
			cell.value = new_value
			for callback in pairs(cell.callbacks) do
				callback(new_value)
			end
		end
		return cell
	end

	local function ComputeCell(...)
		local count = select("#", ...)
		local compute = select(count, ...)
		local deps = { ... }
		deps[count] = nil

		local cell = InputCell(nil)

		local function recompute()
			local args = {}
			for i, dep in ipairs(deps) do
				if dep.calc then dep.calc() end
				args[i] = dep.get_value()
			end
			cell.set_value(compute(table.unpack(args)))
		end

		cell.calc = recompute
		for _, dep in ipairs(deps) do
			dep.watch(recompute)
		end
		recompute()

		return cell
	end

	return { InputCell = InputCell, ComputeCell = ComputeCell }
end

return react
