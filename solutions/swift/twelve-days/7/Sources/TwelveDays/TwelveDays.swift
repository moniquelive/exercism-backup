class TwelveDaysSong {
  private static let ordinals = [
    "first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth",
    "eleventh", "twelfth",
  ]
  private static let subjects = [
    "a Partridge", "two Turtle Doves", "three French Hens", "four Calling Birds", "five Gold Rings",
    "six Geese-a-Laying", "seven Swans-a-Swimming", "eight Maids-a-Milking", "nine Ladies Dancing",
    "ten Lords-a-Leaping", "eleven Pipers Piping", "twelve Drummers Drumming",
  ]
  private static func joinSubjects(_ n: Int) -> String {
    if n == 0 { return subjects[0] }
    if n == 1 { return subjects[1] + ", and " + subjects[0] }
    return subjects[n] + ", " + joinSubjects(n - 1)
  }
  private static func verse(_ v: Int) -> String {
    "On the \(ordinals[v-1]) day of Christmas my true love gave to me: \(joinSubjects(v-1)) in a Pear Tree."
  }
  static func recite(start: Int, end: Int) -> String {
    (start...end).map(verse).joined(separator: "\n")
  }
}
