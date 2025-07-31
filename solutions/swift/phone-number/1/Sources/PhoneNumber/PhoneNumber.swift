enum PhoneNumberError: Error { case invalidPhoneNumber }

class PhoneNumber {
  let phone: [Character]

  init(_ phone: String) {
    let p = Array(phone)
    self.phone =
      (p.prefix(2) == ["+", "1"]
      ? Array(p.dropFirst(2))
      : p.count == 11 && p[0] == "1"
        ? Array(p.dropFirst())
        : p)
      .filter(("0"..."9").contains)

    // Only on Swift 5.9... More readable in my opinion
    //
    // var p = Array(phone)
    // p =
    //   switch (p[0], p[1]) {
    //   case ("+", "1"): Array(p.dropFirst(2))
    //   case ("1", _) where p.count == 11: Array(p.dropFirst())
    //   default: p
    //   }
    // self.phone = p.filter(("0"..."9").contains)
  }

  func clean() throws -> String {
    guard
      phone.count == 10
        && phone[0] != "0" && phone[0] != "1"
        && phone[3] != "0" && phone[3] != "1"
    else { throw PhoneNumberError.invalidPhoneNumber }
    return String(phone)
  }
}
