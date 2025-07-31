enum Bearing { case north, south, east, west }
struct State {
  var x, y: Int
  var bearing: Bearing
  mutating func turnLeft() {
    switch self.bearing {
    case .north: self.bearing = .west
    case .south: self.bearing = .east
    case .east: self.bearing = .north
    case .west: self.bearing = .south
    }
  }
  mutating func turnRight() {
    switch self.bearing {
    case .north: self.bearing = .east
    case .south: self.bearing = .west
    case .east: self.bearing = .south
    case .west: self.bearing = .north
    }
  }
  mutating func advance() {
    switch self.bearing {
    case .north: self.y += 1
    case .south: self.y -= 1
    case .east: self.x += 1
    case .west: self.x -= 1
    }
  }
}
class SimulatedRobot {
  var state: State
  init(x: Int, y: Int, bearing: Bearing) { self.state = State(x: x, y: y, bearing: bearing) }
  func move(commands: String) {
    for c in commands {
      switch c {
      case "L": self.state.turnLeft()
      case "R": self.state.turnRight()
      case "A": self.state.advance()
      default: fatalError()
      }
    }
  }
}
