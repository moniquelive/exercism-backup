enum PhoneNumberError: Error { case invalidPhoneNumber }

class PhoneNumber {
  let phone: String

  init(_ phone: String) {
    let n = phone.filter(\.isNumber)
    self.phone = n.count == 11 && n.first == "1" ? String(n.dropFirst()) : n
  }

  func clean() throws -> String {
    let isDigitValid = { !["0", "1"].contains(self.phone.dropFirst($0).first) }
    guard phone.count == 10 && isDigitValid(0) && isDigitValid(3)
    else { throw PhoneNumberError.invalidPhoneNumber }
    return phone
  }
}
