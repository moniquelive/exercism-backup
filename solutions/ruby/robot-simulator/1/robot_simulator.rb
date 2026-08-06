# frozen_string_literal: true

# class Robot
class Robot
  attr_reader :bearing, :coordinates

  def orient(bearing)
    raise ArgumentError unless %i[north east south west].include?(bearing)

    @bearing = bearing
  end

  def at(coord_x, coord_y) = @coordinates = [coord_x, coord_y]
  def turn_left = @bearing = { north: :west, south: :east, east: :north, west: :south }[@bearing]
  def turn_right = @bearing = { north: :east, south: :west, east: :south, west: :north }[@bearing]

  def advance = (@coordinates[0] += { north: 0, east: 1, south: 0, west: -1 }[@bearing]
                 @coordinates[1] += { north: 1, east: 0, south: -1, west: 0 }[@bearing])
end

# class Simulator
class Simulator
  def instructions(commands) =
    commands.chars.map { { 'L' => :turn_left, 'R' => :turn_right, 'A' => :advance }[_1] }

  def evaluate(robot, commands) =
    instructions(commands).each { robot.public_send(_1) }

  def place(robot, x:, y:, direction:)
    robot.at(x, y)
    robot.orient(direction)
  end
end
