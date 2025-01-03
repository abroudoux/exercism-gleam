import exercism
import gleeunit
import gleeunit/should

pub fn main() {
  gleeunit.main()
}

pub fn hello_world_test() {
  exercism.main()
  |> should.equal("Hello, World!")
}
