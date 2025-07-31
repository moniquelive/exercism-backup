"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
ispangram(s) = all('a':'z' .∈ lowercase(s))

