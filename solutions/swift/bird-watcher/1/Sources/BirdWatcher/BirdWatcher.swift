func totalBirdCount(_ birdsPerDay: [Int]) -> Int { birdsPerDay.reduce(0, +) }

func birdsInWeek(_ birdsPerDay: [Int], weekNumber: Int) -> Int {
  birdsPerDay.dropFirst(7 * (weekNumber - 1)).prefix(7).reduce(0, +)
}

func fixBirdCountLog(_ birdsPerDay: [Int]) -> [Int] {
  birdsPerDay.enumerated().map { (index, bird) in bird + 1 - index % 2 }
}
