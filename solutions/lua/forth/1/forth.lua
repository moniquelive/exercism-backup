local function evaluate(instructions)
	local stack = setmetatable({}, { __index = table })
	local words = {
		["+"] = function()
			assert(#stack >= 2)
			local a, b = stack:remove(), stack:remove()
			stack:insert(a + b)
		end,
		["-"] = function()
			assert(#stack >= 2)
			local a, b = stack:remove(), stack:remove()
			stack:insert(b - a)
		end,
		["*"] = function()
			assert(#stack >= 2)
			local a, b = stack:remove(), stack:remove()
			stack:insert(a * b)
		end,
		["/"] = function()
			assert(#stack >= 2)
			local a, b = stack:remove(), stack:remove()
			stack:insert(b // a)
		end,
		dup = function()
			assert(#stack > 0)
			local a = stack:remove()
			stack:insert(a)
			stack:insert(a)
		end,
		drop = function()
			assert(#stack > 0)
			stack:remove()
		end,
		swap = function()
			assert(#stack >= 2)
			local a, b = stack:remove(), stack:remove()
			stack:insert(a)
			stack:insert(b)
		end,
		over = function()
			assert(#stack >= 2)
			stack:insert(stack[#stack - 1])
		end,
	}
	local userdefs = {}
	local function run(line)
		for token in line:gmatch("%S+") do
			if tonumber(token) then
				stack:insert(tonumber(token))
			elseif userdefs[token] then
				run(userdefs[token])
			elseif words[token] then
				words[token]()
			elseif token == ":" then
				local name, body = line:match("^:%s+(%S+)%s+(.+)%s+;")
				assert(name:match("^[-+*/%a]+$"), "invalid word")
				local l = ""
				for b in body:lower():gmatch("%S+") do
					l = l .. (userdefs[b] or b) .. " "
				end
				userdefs[name] = l
				return
			else
				error("syntax error: " .. token)
			end
		end
	end
	for _, ins in ipairs(instructions) do
		run(ins:lower())
	end
	return stack
end

return { evaluate = evaluate }
