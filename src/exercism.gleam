import gleam/io
import gleam/int

pub fn main() {
  io.debug(is_divisible_by(16, 4))
}

pub fn is_leap_year(year: Int) -> Bool {
  case is_divisible_by(year, 4), is_divisible_by(year, 100), is_divisible_by(year, 400) {
    True, True, True -> True
    True, False, _ -> True
    _, _, _ -> False
  }
}

pub fn is_divisible_by(year: Int, divisor: Int) -> Bool {
  case int.modulo(year, divisor) {
    Ok(0) -> True
    _ -> False
  }
}
