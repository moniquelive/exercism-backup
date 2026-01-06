return {
	total = function(basket)
		local books = { 0, 0, 0, 0, 0 }
		for _, book in ipairs(basket) do
			books[book] = books[book] + 1
		end
		table.sort(books)
		local groups = {
			books[5] - books[4],
			books[4] - books[3],
			books[3] - books[2],
			books[2] - books[1],
			books[1],
		}
		local min = math.min(groups[5], groups[3])
		groups[5] = groups[5] - min
		groups[3] = groups[3] - min
		groups[4] = groups[4] + 2 * min

		local p1 = 100 * groups[1]
		local p2 = 95 * 2 * groups[2]
		local p3 = 90 * 3 * groups[3]
		local p4 = 80 * 4 * groups[4]
		local p5 = 75 * 5 * groups[5]
		return 8 * (p1 + p2 + p3 + p4 + p5)
	end,
}
