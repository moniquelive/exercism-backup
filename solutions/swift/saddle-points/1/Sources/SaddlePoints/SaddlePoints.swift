struct SaddlePoints {
    static func r(_ n: Int, _ input: [[Int]]) -> [Int] { input[n] }
    static func c(_ n: Int, _ input: [[Int]]) -> [Int] { input.map { $0[n] } }
    static func saddlePoints(_ input: [[Int]]) -> [Position] {
        var result = [Position]()
        for i in 0..<input.count {
            for j in 0..<input[0].count
            where input[i][j] == r(i, input).max()
                && input[i][j] == c(j, input).min()
            {
                result.append(Position(row: i + 1, column: j + 1))
            }
        }
        return result
    }
}
