const reSpaces = /\s+/g;
const reDigits = /\d+/g;

/**
 * Checks if the given string complies with the Luhn formula.
 * @param s The string to check.
 * @returns True if the string is valid according to the Luhn formula, false otherwise.
 */
export function valid(s: string): boolean {
    // Remove spaces
    s = s.replace(reSpaces, '');
    
    if (s.length < 2) {
        return false;
    }
    
    // Check if the string contains only digits
    if (s.replace(reDigits, '').length > 0) {
        return false;
    }
    
    const digits = s.split('').map(Number);
    const lastIndex = digits.length - 1;
    const parity = lastIndex % 2;
    
    const sum = digits.reduce((acc, digit, index) => {
        if (index === lastIndex) {
            return acc + digit;
        }
        
        if (index % 2 !== parity) {
            digit *= 2;
            if (digit > 9) {
                digit -= 9;
            }
        }
        
        return acc + digit;
    }, 0);
    
    return sum % 10 === 0;
}
