pub fn eggCount(number: usize) usize {
    var n = number;
    var bits: usize = 0;
    while (n != 0) : (n >>= 1) {
        bits += (n & 1);
    }
    return bits;
}
