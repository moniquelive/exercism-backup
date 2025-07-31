pub fn eggCount(number: usize) usize {
    // Published in 1988, the C Programming Language 2nd Ed.
    // (by Brian W. Kernighan and Dennis M. Ritchie)
    // mentions this in exercise 2-9.
    // On April 19, 2006 Don Knuth pointed out to me that this method
    // "was first published by Peter Wegner in CACM 3 (1960),
    // 322. (Also discovered independently by Derrick Lehmer
    // and published in 1964 in a book edited by Beckenbach.)"
    var count: usize = 0;
    var n = number;
    while (n != 0) : (count += 1) {
        n &= n - 1;
    }
    return count;
}
