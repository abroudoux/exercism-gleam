import gleam/io

pub fn main() {
  io.debug(difference(10))
}

pub fn square_of_sum(n: Int) -> Int {
  let total: Int = calculate_square_of_sum(n)
  total * total
}

pub fn calculate_square_of_sum(n: Int) -> Int {
  case n {
    0 -> 0
    1 -> 1
    _ -> n + calculate_square_of_sum(n - 1)
  }
}

pub fn sum_of_squares(n: Int) -> Int {
  case n {
    0 -> 0
    _ -> n * n + sum_of_squares(n - 1)
  }
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}