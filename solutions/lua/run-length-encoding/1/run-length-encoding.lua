return {
	encode = function(s)
		local retval, count = "", 1
		for i = 1, #s do
			local ch = s:sub(i, i)
			if ch == s:sub(i + 1, i + 1) then
				count = count + 1
			else
				if count > 1 then retval = retval .. count end
				retval = retval .. ch
				count = 1
			end
		end
		return retval
	end,
	decode = function(s)
		local retval, count = "", 0
		for ch in s:gmatch(".") do
			if ch:match("%d") then
				count = count * 10 + tonumber(ch)
			else
				retval = retval .. string.rep(ch, math.max(count, 1))
				count = 0
			end
		end
		return retval
	end,
}
