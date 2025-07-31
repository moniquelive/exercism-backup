enum PhoneNumberError: Error { case invalidPhoneNumber }

class PhoneNumber {
  let phone: [Character]

  init(_ phone: String) {
    let p = Array(phone).filter(\.isNumber)
    self.phone = p.count == 11 && p[0] == "1" ? Array(p.dropFirst()) : p
  }

  func clean() throws -> String {
    let isDigitValid = { self.phone[$0] != "0" && self.phone[$0] != "1" }
    guard phone.count == 10 && isDigitValid(0) && isDigitValid(3)
    else { throw PhoneNumberError.invalidPhoneNumber }
    return String(phone)
  }
}
