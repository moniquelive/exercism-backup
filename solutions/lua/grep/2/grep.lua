return function(options)
	local matches = setmetatable({}, { __index = table })
	local flags = table.concat(options.flags)
	local pattern = options.pattern
	if flags:match("-x") then pattern = ("^%s$"):format(pattern) end
	if flags:match("-i") then pattern = string.lower(pattern) end

	local function filegrep(filename)
		local n = 1
		for line in io.lines(filename) do
			local match_line = line
			if flags:match("-i") then match_line = match_line:lower() end
			if flags:match("-v") then
				if not match_line:match(pattern) then
					matches:insert({ filename = filename, line = n, contents = line })
				end
			else
				if match_line:match(pattern) then matches:insert({ filename = filename, line = n, contents = line }) end
			end
			n = n + 1
		end
	end

	local function result(nfiles)
		local r = setmetatable({}, { __index = table })
		for _, match in ipairs(matches) do
			local line = match.contents
			if flags:match("-n") then line = ("%d:%s"):format(match.line, line) end
			if nfiles > 1 then line = ("%s:%s"):format(match.filename, line) end
			if flags:match("-l") then line = match.filename end
			if #r == 0 or r[#r] ~= line then r:insert(line) end
		end
		return r
	end

	for _, file in ipairs(options.files) do
		filegrep(file)
	end
	return result(#options.files)
end
