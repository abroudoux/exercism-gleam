import exercism
import gleeunit
import gleeunit/should

pub fn main() {
  gleeunit.main()
}

pub fn expected_minutes_in_oven_test() {
  exercism.expected_minutes_in_oven()
  |> should.equal(40)
}

pub fn remaining_minutes_in_oven_test() {
  exercism.remaining_minutes_in_oven(10)
  |> should.equal(30)
}

pub fn preparation_time_in_minutes_test() {
  exercism.preparation_time_in_minutes(3)
  |> should.equal(6)
}

pub fn total_time_in_minutes_test() {
  exercism.total_time_in_minutes(3, 10)
  |> should.equal(16)
}

pub fn alarm_test() {
  exercism.alarm()
  |> should.equal("Ding!")
}