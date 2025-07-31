return {
  transform = function(dataset)
    local result = {}
    for score, letters in pairs(dataset) do
      for _, letter in ipairs(letters) do
        result[letter:lower()] = score
      end
    end
    return result
  end
}
