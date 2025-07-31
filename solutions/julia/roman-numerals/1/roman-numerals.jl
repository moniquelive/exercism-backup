const keys = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
const values = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]

function to_roman(number)
    if number <= 0
        error("number <= 0")
    end
    return to_r(number)
end

function to_r(number)
    if number < 1
        return ""
    end

    for (index, key) in enumerate(keys)
        if number >= key
            return values[index] * to_r(number - key)
        end
    end
end
