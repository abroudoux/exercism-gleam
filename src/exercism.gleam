import gleam/int
import gleam/io
import gleam/string

pub type Robot {
  Robot(direction: Direction, position: Position)
}

pub type Direction {
  North
  East
  South
  West
}

pub type Position {
  Position(x: Int, y: Int)
}

pub fn create(direction: Direction, position: Position) -> Robot {
  Robot(direction: direction, position: position)
}

pub fn move(
  direction: Direction,
  position: Position,
  instructions: String,
) -> Robot {
  case string.first(instructions) {
    Ok("R") -> move(
      change_and_return_direction(direction, "R"),
      position,
      return_string_without_first_char(instructions)
    )
    Ok("L") -> move(
      change_and_return_direction(direction, "L"),
      position,
      return_string_without_first_char(instructions)
    )
    Ok("A") -> move(
      direction,
      change_and_return_position(direction, position),
      return_string_without_first_char(instructions)
    )
    Ok(_) -> Robot(direction: direction, position: position)
    Error(Nil) -> Robot(direction: direction, position: position)
  }
}

fn change_and_return_direction(direction: Direction, instruction: String) -> Direction {
  case determine_orientation(instruction) {
    1 -> return_next_direction(direction)
    -1 -> return_previous_direction(direction)
    _ -> panic
  }
}

fn determine_orientation(instruction: String) -> Int {
  case instruction {
    "R" -> 1
    "L" -> -1
    _ -> 0
  }
}

fn return_previous_direction(direction: Direction) -> Direction { 
  case direction {
    North -> West
    East -> North
    South -> East
    West -> South
  }
}

fn return_next_direction(direction: Direction) -> Direction {
  case direction {
    North -> East
    East -> South
    South -> West
    West -> North
  }
}

fn change_and_return_position(direction: Direction, position: Position) -> Position {
  case direction {
    North -> Position(position.x, position.y + 1)
    East -> Position(position.x + 1, position.y)
    South -> Position(position.x, position.y - 1)
    West -> Position(position.x - 1, position.y)
  }
}

fn return_string_without_first_char(string: String) -> String {
  case string.pop_grapheme(string) {
    Ok(#(_, tail)) -> tail
    _ -> ""
  }
}

pub fn direction_to_string(direction: Direction) -> String {
  case direction {
    North -> "North"
    East -> "East"
    South -> "South"
    West -> "West"
  }
}

pub fn print_robot_direction(robot: Robot) {
  let direction: String = robot.direction
  |> direction_to_string
  io.println(direction)
}

fn print_robot_coordinates(robot: Robot) {
  let x: String = robot.position.x
  |> int.to_string
  let y: String = robot.position.y
  |> int.to_string
  io.println(x)
  io.println(y)
}

pub fn main() {
  let robot: Robot = create(North, Position(x: 7, y: 3))
  let robot_moved = move(robot.direction, robot.position, "RAA")
  // let robot_moved = move(robot.direction, robot.position, "RAALAL")
  print_robot_direction(robot_moved)
  print_robot_coordinates(robot_moved)
  // move(North, Position(x: 7, y: 3), "RAALAL")
}