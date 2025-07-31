enum Direction: Int { case north, east, south, west }

struct RobotState {
  var x, y: Int
  var bearing: Direction

  mutating func turnLeft() { bearing = Direction(rawValue: (bearing.rawValue + 3) % 4)! }
  mutating func turnRight() { bearing = Direction(rawValue: (bearing.rawValue + 1) % 4)! }
  mutating func advance() {
    (x, y) = (
      x + (bearing == .east ? 1 : bearing == .west ? -1 : 0),
      y + (bearing == .north ? 1 : bearing == .south ? -1 : 0)
    )
  }
}

class SimulatedRobot {
  var state: RobotState

  init(x: Int, y: Int, bearing: Direction) {
    state = RobotState(x: x, y: y, bearing: bearing)
  }

  func move(commands: String) {
    for c in commands {
      switch c {
      case "L": state.turnLeft()
      case "R": state.turnRight()
      case "A": state.advance()
      default: fatalError()
      }
    }
  }
}
