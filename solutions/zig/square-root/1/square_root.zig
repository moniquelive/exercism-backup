pub fn squareRoot(radicand: usize) usize {
    if (radicand == 0 or radicand == 1)
        return radicand;

    var x = radicand / 2;
    var y = (x + radicand / x) / 2;

    while (y < x) {
        x = y;
        y = (x + radicand / x) / 2;
    }
    return x;
}
