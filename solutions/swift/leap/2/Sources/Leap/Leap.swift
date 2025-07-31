struct Year {
  let calendarYear: Int

  var isLeapYear: Bool {
    calendarYear % 4 == 0
      && (calendarYear % 100 != 0 || calendarYear % 400 == 0)
  }
}
