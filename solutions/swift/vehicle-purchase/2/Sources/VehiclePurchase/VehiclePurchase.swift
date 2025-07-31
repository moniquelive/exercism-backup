func canIBuy(vehicle: String, price: Double, monthlyBudget: Double) -> String {
  let monthlyPrice = price / (5 * 12)

  return if monthlyPrice <= monthlyBudget {
    "Yes! I'm getting a \(vehicle)"
  } else if monthlyPrice <= monthlyBudget * 1.1 {
    "I'll have to be frugal if I want a \(vehicle)"
  } else {
    "Darn! No \(vehicle) for me"
  }
}

func licenseType(numberOfWheels wheels: Int) -> String {
  if wheels == 2 || wheels == 3 {
    "You will need a motorcycle license for your vehicle"
  } else if wheels == 4 || wheels == 6 {
    "You will need an automobile license for your vehicle"
  } else if wheels == 18 {
    "You will need a commercial trucking license for your vehicle"
  } else {
    "We do not issue licenses for those types of vehicles"
  }
}

func calculateResellPrice(originalPrice: Int, yearsOld: Int) -> Int {
  if yearsOld < 3 {
    (originalPrice * 80) / 100
  } else if yearsOld >= 10 {
    (originalPrice * 50) / 100
  } else if yearsOld >= 3 && yearsOld < 10 {
    (originalPrice * 70) / 100
  } else {
    0
  }
}
