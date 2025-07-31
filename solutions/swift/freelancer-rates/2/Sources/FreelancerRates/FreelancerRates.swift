func dailyRateFrom(hourlyRate: Int) -> Double {
  8 * Double(hourlyRate)
}

let d = { 1 - $0 / 100.0 }

func monthlyRateFrom(hourlyRate: Int, withDiscount discount: Double) -> Double {
  let result = 22 * dailyRateFrom(hourlyRate: hourlyRate) * d(discount)
  return result.rounded()
}

func workdaysIn(budget: Double, hourlyRate: Int, withDiscount discount: Double) -> Double {
  let result = budget / (dailyRateFrom(hourlyRate: hourlyRate) * d(discount))
  return result.rounded(.down)
}
