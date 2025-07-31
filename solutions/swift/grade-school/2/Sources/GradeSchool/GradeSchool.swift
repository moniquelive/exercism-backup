class GradeSchool {
  var r: [Int: [String]] = [:]

  func addStudent(_ name: String, grade: Int) -> Bool {
    guard !roster().contains(name) else { return false }

    r[grade, default: []].append(name)
    return true
  }

  func studentsInGrade(_ grade: Int) -> [String] { r[grade]?.sorted() ?? [] }
  func roster() -> [String] { r.keys.sorted().flatMap(studentsInGrade) }
}
