class Squares {
    let n: Int

    init(_ n: Int) {
        self.n = n
    }

    var squareOfSum: Int {
        let sum = n * (n + 1) / 2
        return sum * sum
    }

    var sumOfSquares: Int {
        return (n * (n + 1) * (2 * n + 1)) / 6
    }

    var differenceOfSquares: Int {
        return squareOfSum - sumOfSquares
    }
}
