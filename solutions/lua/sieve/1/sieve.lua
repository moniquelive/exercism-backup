return function(n)
	return coroutine.create(function()
		local sieve = {}
		for i = 2, 1000 do
			sieve[i] = true
		end
		for i, p in pairs(sieve) do
			if p then
				for j = i * i, #sieve, i do
					sieve[j] = false
				end
			end
		end
		for i = 1, n do
			if sieve[i] then
				coroutine.yield(i)
			end
		end
	end)
end
