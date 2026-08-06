return {
	solve = function(puzzle)
		local letters = {}
		local seen = {}
		for ch in puzzle:gmatch("%u") do
			if not seen[ch] then
				seen[ch] = true
				letters[#letters + 1] = ch
			end
		end
		if #letters > 10 then return nil end

		local leading = {}
		for word in puzzle:gmatch("%u+") do
			if #word > 1 then leading[word:sub(1, 1)] = true end
		end

		local spaced = puzzle:gsub("==", " == "):gsub("([%+%*%^])", " %1 ")
		local tokens = {}
		for tok in spaced:gmatch("%S+") do
			tokens[#tokens + 1] = tok
		end

		local prec = { ["^"] = 3, ["*"] = 2, ["+"] = 1, ["=="] = 0 }
		local right = { ["^"] = true }
		local output = {}
		local ops = {}
		for _, tok in ipairs(tokens) do
			if prec[tok] then
				while #ops > 0 do
					local top = ops[#ops]
					if (right[tok] and prec[tok] < prec[top]) or (not right[tok] and prec[tok] <= prec[top]) then
						output[#output + 1] = table.remove(ops)
					else
						break
					end
				end
				ops[#ops + 1] = tok
			else
				local num = tonumber(tok)
				output[#output + 1] = num or tok
			end
		end
		while #ops > 0 do output[#output + 1] = table.remove(ops) end

		local word_letters = {}
		for _, tok in ipairs(output) do
			if type(tok) == "string" and not prec[tok] and not word_letters[tok] then
				local letters = {}
				for i = 1, #tok do
					letters[i] = tok:sub(i, i)
				end
				word_letters[tok] = letters
			end
		end

		local function value(tok, assign)
			if type(tok) == "number" then return tok end
			local acc = 0
			local letters = word_letters[tok]
			for i = 1, #letters do
				acc = acc * 10 + assign[letters[i]]
			end
			return acc
		end

		local used = {}
		local assign = {}

		local function eval_expr()
			local stack = {}
			for _, tok in ipairs(output) do
				if not prec[tok] then
					stack[#stack + 1] = value(tok, assign)
				else
					local b = stack[#stack]
					stack[#stack] = nil
					local a = stack[#stack]
					stack[#stack] = nil
					if tok == "+" then
						stack[#stack + 1] = a + b
					elseif tok == "*" then
						stack[#stack + 1] = a * b
					elseif tok == "^" then
						stack[#stack + 1] = a ^ b
					elseif tok == "==" then
						stack[#stack + 1] = a == b
					end
				end
			end
			return stack[1] == true
		end

		local function backtrack(index)
			if index > #letters then return eval_expr() end

			local ch = letters[index]
			for digit = 0, 9 do
				if not used[digit] and not (digit == 0 and leading[ch]) then
					used[digit] = true
					assign[ch] = digit
					if backtrack(index + 1) then return true end
					assign[ch] = nil
					used[digit] = nil
				end
			end
			return false
		end

		if backtrack(1) then return assign end
		return nil
	end,
}
