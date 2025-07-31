import Foundation

class Meetup {
  let dt: Date
  var description: String { dt.formatted(.iso8601.year().month().day()) }

  init(year: Int, month: Int, week: String, weekday: String) {
    var cal = Calendar.init(identifier: .gregorian)
    cal.locale = Locale(identifier: "en_US_POSIX")

    var dc = DateComponents(
      calendar: cal,
      year: year,
      month: month,
      weekday: cal.weekdaySymbols.firstIndex(of: weekday)! + 1,
      weekdayOrdinal: ["first": 1, "second": 2, "third": 3, "fourth": 4, "last": -1][week]
    )
    if dc.weekdayOrdinal == nil {
      dc.day = (13...19).first {
        dc.day = $0
        return dc.isValidDate
      }
    }
    dt = dc.date!
  }
}
