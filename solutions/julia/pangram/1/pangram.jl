"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input)
    charlist = collect(lowercase(input))
    unique_chars = unique(charlist)
    count = 0
    for c in unique_chars
        if 'a' <= c <= 'z'
            count += 1
        end
    end
    count == 26
end
