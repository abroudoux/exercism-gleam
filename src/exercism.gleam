import gleam/io
import gleam/int

pub fn convert(number: Int) -> String {
  let result: String = case is_divisible(number, 3), is_divisible(number, 5), is_divisible(number, 7) {
      True, True, False -> "PlingPlang"
      False, True, True -> "PlangPlong"
      True, False, True -> "PlingPlong"
      True, True, True -> "PlingPlangPlong"
      True, False, False -> "Pling"
      False, True, False -> "Plang"
      False, False, True -> "Plong"
      _, _, _ -> int.to_string(number)
  }

  result
}

pub fn is_divisible(number: Int, divisor: Int) -> Bool {
  case int.modulo(number, divisor) {
    Ok(0) -> True
    _ -> False
  }
}

pub fn main() {
  io.debug(convert(105))
}