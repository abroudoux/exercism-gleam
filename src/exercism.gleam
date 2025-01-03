import gleam/int

pub fn convert(number: Int) -> String {
  case number {
    _ -> int.to_string(number)
  }
}

pub fn is_divisible(number: Int, divisor: Int) -> Bool {
  case int.modulo(number, divisor) {
    Ok(0) -> True
    _ -> False
  }
}