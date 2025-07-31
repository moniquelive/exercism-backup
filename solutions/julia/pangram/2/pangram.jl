"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input)
    lowercase_chars = lowercase(input)
    unique_chars = unique([c for c in lowercase_chars if 'a' <= c <= 'z'])
    length(unique_chars) == 26
end
