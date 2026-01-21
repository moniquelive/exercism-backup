return {
	decode = function(bytes)
		local result, value, in_progress = {}, 0, false
		for _, byte in ipairs(bytes) do
			value = (value << 7) | (byte & 0x7f)
			if (byte & 0x80) == 0 then
				result[#result + 1], value, in_progress = value, 0, false
			else
				in_progress = true
			end
		end
		assert(not in_progress, "incomplete sequence")
		return result
	end,
	encode = function(values)
		local result = setmetatable({}, { __index = table })
		for _, value in ipairs(values) do
			if value == 0 then
				result:insert(0)
			else
				local shift, temp = 0, value
				while temp > 0x7f do
					shift, temp = shift + 7, temp >> 7
				end
				for s = shift, 0, -7 do
					local byte = (value >> s) & 0x7f
					if s > 0 then byte = byte | 0x80 end
					result:insert(byte)
				end
			end
		end
		return result
	end,
}
