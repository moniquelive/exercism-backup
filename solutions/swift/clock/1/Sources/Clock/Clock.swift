import Foundation

struct Clock: Equatable {
  private let total: Int

  init(hours: Int = 0, minutes: Int = 0) {
    let t = (hours * 60 + minutes) % 1440
    total = t + (t < 0 ? 1440 : 0)
  }

  func add(minutes: Int) -> Clock { Clock(minutes: total + minutes) }
  func subtract(minutes: Int) -> Clock { Clock(minutes: total - minutes) }

  var description: String {
    String(format: "%02d:%02d", total / 60, total % 60)
  }
}
