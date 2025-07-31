func timeToPrepare(drinks: [String]) -> Double {
  var minutes = 0.0
  for drink in drinks {
    switch drink {
    case "beer", "soda", "water": minutes += 0.5
    case "shot": minutes += 1.0
    case "mixed drink": minutes += 1.5
    case "fancy drink": minutes += 2.5
    case "frozen drink": minutes += 3
    default: break
    }
  }
  return minutes
}

func makeWedges(needed: Int, limes: [String]) -> Int {
  var needed = needed
  var limes = limes
  var wedges = 0
  while needed > 0 && !limes.isEmpty {
    switch limes.removeFirst() {
    case "small":
      if needed >= 6 { wedges += 6 }
      needed -= 6
    case "medium":
      if needed >= 8 { wedges += 8 }
      needed -= 8
    case "large":
      if needed >= 10 { wedges += 10 }
      needed -= 10
    default: break
    }
  }
  return wedges
}

func finishShift(minutesLeft: Int, remainingOrders: [[String]]) -> [[String]] {
  var minutesLeft = Double(minutesLeft)
  let remainingOrders = remainingOrders
  while true {
    let time = timeToPrepare(drinks: remainingOrders[0])
    if minutesLeft - time < 0 { break }
    minutesLeft -= time
    _ = remainingOrders.dropFirst()
  }
  return remainingOrders
}

func orderTracker(orders: [(drink: String, time: String)]) -> (
  beer: (first: String, last: String, total: Int)?, soda: (first: String, last: String, total: Int)?
) {
  return (beer: ("", "", 0), soda: ("", "", 0))
}
