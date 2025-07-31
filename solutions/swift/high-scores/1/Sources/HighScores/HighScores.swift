struct HighScores {
    let scores: [Int]
    let personalBest: Int
    let latest: Int
    let topThree: [Int]
    init(scores: [Int], personalBest: Int? = nil) {
        self.scores = scores
        self.personalBest = personalBest ?? scores.max()!
        self.latest = scores.last!
        self.topThree = Array(scores.sorted().reversed().prefix(3))
    }
}
