let d = { (discount: Double) -> Double in return (1 - discount / 100.0) }

func dailyRateFrom(hourlyRate: Int) -> Double {
  8 * Double(hourlyRate)
}

func monthlyRateFrom(hourlyRate: Int, withDiscount discount: Double) -> Double {
  let result = 22 * dailyRateFrom(hourlyRate: hourlyRate) * d(discount)
  return result.rounded()
}

func workdaysIn(budget: Double, hourlyRate: Int, withDiscount discount: Double) -> Double {
  let result = budget / (dailyRateFrom(hourlyRate: hourlyRate) * d(discount))
  return result.rounded(.down)
}
