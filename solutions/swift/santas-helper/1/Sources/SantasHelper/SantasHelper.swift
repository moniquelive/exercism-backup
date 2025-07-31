import Foundation

func cartesianToPolar(_ cart: (x: Double, y: Double)) -> (r: Double, phi: Double) {
  (r: (cart.x * cart.x + cart.y * cart.y).squareRoot(), phi: atan2(cart.y, cart.x))
}

func combineRecords(
  production: (toy: String, id: Int, productLead: String),
  gifts: (Int, [String])
) -> (id: Int, toy: String, productLead: String, recipients: [String]) {
  (id: production.id, toy: production.toy, productLead: production.productLead, recipients: gifts.1)
}
