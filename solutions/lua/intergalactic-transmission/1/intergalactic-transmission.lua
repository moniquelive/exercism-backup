local function popcount(byte)
	local count = 0
	while byte > 0 do
		count = count + (byte & 1)
		byte = byte >> 1
	end
	return count
end

return {
	transmit_sequence = function(sequence)
		local transmission = {}
		local byte = 0
		local bit_count = 0
		local ones = 0

		for _, value in ipairs(sequence) do
			for bit = 7, 0, -1 do
				local data_bit = (value >> bit) & 1

				byte = (byte << 1) | data_bit
				bit_count = bit_count + 1
				ones = ones + data_bit

				if bit_count == 7 then
					table.insert(transmission, (byte << 1) | (ones % 2))
					byte, bit_count, ones = 0, 0, 0
				end
			end
		end

		if bit_count > 0 then
			byte = byte << (7 - bit_count)
			table.insert(transmission, (byte << 1) | (ones % 2))
		end

		return transmission
	end,

	decode_message = function(message)
		local sequence = {}
		local byte = 0
		local bit_count = 0

		for _, value in ipairs(message) do
			assert(popcount(value) % 2 == 0, "wrong parity")

			for bit = 7, 1, -1 do
				byte = (byte << 1) | ((value >> bit) & 1)
				bit_count = bit_count + 1

				if bit_count == 8 then
					table.insert(sequence, byte)
					byte, bit_count = 0, 0
				end
			end
		end

		return sequence
	end,
}
