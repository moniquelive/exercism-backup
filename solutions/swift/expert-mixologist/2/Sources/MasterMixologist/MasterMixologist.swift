func timeToPrepare(drinks: [String]) -> Double {
  let drinksToTime = [
    "beer": 0.5, "soda": 0.5, "water": 0.5, "shot": 1.0,
    "mixed drink": 1.5, "fancy drink": 2.5, "frozen drink": 3.0,
  ]
  var minutes = 0.0
  for drink in drinks {
    minutes += drinksToTime[drink, default: 0]
  }
  return minutes
}

func makeWedges(needed: Int, limes: [String]) -> Int {
  let limeToWedges = ["small": 6, "medium": 8, "large": 10]
  var needed = needed
  var wedges = 0
  for lime in limes {
    if needed <= 0 { break }
    wedges += 1
    needed -= limeToWedges[lime, default: 0]
  }
  return wedges
}

func finishShift(minutesLeft: Int, remainingOrders: [[String]]) -> [[String]] {
  var minutesLeft = Double(minutesLeft)
  var remainingOrders = remainingOrders
  while minutesLeft > 0 && !remainingOrders.isEmpty {
    minutesLeft -= timeToPrepare(drinks: remainingOrders.removeFirst())
  }
  return remainingOrders
}

func orderTracker(orders: [(drink: String, time: String)]) -> (
  beer: (first: String, last: String, total: Int)?,
  soda: (first: String, last: String, total: Int)?
) {
  var beer: (first: String, last: String, total: Int)?
  var soda: (first: String, last: String, total: Int)?
  for order in orders {
    switch order.drink {
    case "beer":
      beer = (first: beer?.first ?? order.time, last: order.time, total: (beer?.total ?? 0) + 1)
    case "soda":
      soda = (first: soda?.first ?? order.time, last: order.time, total: (soda?.total ?? 0) + 1)
    default: break
    }
  }
  return (beer: beer, soda: soda)
}
