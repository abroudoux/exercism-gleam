pub fn expected_minutes_in_oven() -> Int {
  40
}

pub fn remaining_minutes_in_oven(time: Int) -> Int {
  expected_minutes_in_oven() - time
}

pub fn preparation_time_in_minutes(layers: Int) -> Int {
  layers * 2
}

pub fn total_time_in_minutes(layers: Int, time: Int) -> Int {
  layers * 2 + time
}

pub fn alarm() {
  "Ding!"
}