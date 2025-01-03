pub fn secret_add(secret: Int) -> fn(Int) -> Int {
  fn (x) { secret + x }
}

pub fn secret_subtract(secret: Int) -> fn(Int) -> Int {
  fn (x) { x - secret }
}

pub fn secret_multiply(secret: Int) -> fn(Int) -> Int {
  fn (x) { x * secret }
}

pub fn secret_divide(secret: Int) -> fn(Int) -> Int {
  fn (x) { x / secret }
}

pub fn secret_combine(
  secret_function1: fn(Int) -> Int,
  secret_function2: fn(Int) -> Int,
) -> fn(Int) -> Int {
  fn (x) {
    let intermediate = secret_function1(x)
    secret_function2(intermediate)
  }
}