# AWK Script to validate a string using criteria similar to the Luhn algorithm
function valid(s) {
    # Remove whitespace
    gsub(/[[:space:]]/, "", s)
    nodigits = s
    gsub(/[[:digit:]]/, "", nodigits)
    if (nodigits != "") {
        return 0
    }
    # Check if the string contains only digits after removing non-digit characters
    gsub(/[^[:digit:]]/, "", s)
    # Ensure the length of s is at least 2
    if (length(s) < 2) {
        return 0
    }
    # Reverse the string for processing
    rev = ""
    for(i=length(s);i!=0;i--) rev=(rev substr(s,i,1))

    sum = 0
    for (i = 1; i <= length(rev); i += 2) {
        odd = substr(rev, i, 1) + 0 # Convert to number
        even = (substr(rev, i + 1, 1) + 0) * 2

        if (even > 9) {
            even -= 9
        }

        sum += odd + even
    }

    # Check if the sum modulo 10 is 0
    return (sum % 10 == 0)
}

# Example usage
{
    if (valid($0)) {
        print "true"
    } else {
        print "false"
    }
}

