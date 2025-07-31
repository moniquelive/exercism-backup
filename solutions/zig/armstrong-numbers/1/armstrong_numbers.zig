const math = @import("std").math;

pub fn isArmstrongNumber(num: u128) bool {
    if (num == 0) return true;

    const num_digits = 1 + math.log10_int(num);
    var sum: u128 = 0;

    var i = num;
    while (i != 0 and sum <= num) : (i /= 10) {
        sum += math.pow(u128, i % 10, num_digits);
    }
    return sum == num;
}
