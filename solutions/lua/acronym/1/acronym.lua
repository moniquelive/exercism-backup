return function(inputText)
    -- Replace hyphens with spaces
    local sanitizedText = inputText:gsub("-_", " ")
    
    -- Split the text into words
    local words = {}
    for word in sanitizedText:gmatch("%S+") do
        table.insert(words, word)
    end
    
    -- Process each word
    local acronym = ""
    for _, word in ipairs(words) do
        -- Capitalize the first letter and keep the rest as is
        local capitalizedWord = word:sub(1,1):upper() .. word:sub(2)

        -- Determine if the word is an acronym part
        local acronymPart
        if capitalizedWord:match("^[A-Z:]+$") then
            acronymPart = capitalizedWord:sub(1,1)
        else
            acronymPart = capitalizedWord
        end
        
        -- Keep only uppercase letters for the acronym
        for upperCaseLetter in acronymPart:gmatch("[A-Z]") do
            acronym = acronym .. upperCaseLetter
        end
    end
    
    return acronym
end
