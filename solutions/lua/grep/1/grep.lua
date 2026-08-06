function table.contains(tbl, element)
	for _, value in pairs(tbl) do
		if value == element then return true end
	end
	return false
end

local function grep(result, file, pattern, flags)
	local n = 1
	for line in io.lines(file) do
		local match_line = line
		if flags:contains("-i") then match_line = string.lower(line) end
		if flags:contains("-v") then
			if not match_line:match(pattern) then result:insert({ file, n, line }) end
		else
			if match_line:match(pattern) then result:insert({ file, n, line }) end
		end
		n = n + 1
	end
end

local function result(matches, files, flags)
	local r = setmetatable({}, { __index = table })
	for i = 1, #matches do
		local line = matches[i][3]
		if flags:contains("-n") then line = matches[i][2] .. ":" .. line end
		if #files > 1 then line = matches[i][1] .. ":" .. line end
		if flags:contains("-l") then line = matches[i][1] end
		if not r:contains(line) then r:insert(line) end
	end
	return r
end

return function(options)
	local flags = setmetatable(options.flags, { __index = table })
	-- parse the flags
	if flags:contains("-x") then options.pattern = "^" .. options.pattern .. "$" end
	if flags:contains("-i") then options.pattern = string.lower(options.pattern) end
	-- do the grepping
	local matches = setmetatable({}, { __index = table })
	for _, file in ipairs(options.files) do
		grep(matches, file, options.pattern, flags)
	end
	-- prepare results
	return result(matches, options.files, flags)
end
