import gleam/list

pub fn today(days: List(Int)) -> Int {
  case list.first(days) {
    Ok(day) -> day
    _ -> 0
  }
}

pub fn increment_day_count(days: List(Int)) -> List(Int) {
  case days {
    [first, ..rest] -> [first + 1, ..rest]
    [] -> [1]
  }
}

pub fn has_day_without_birds(days: List(Int)) -> Bool {
  days
  |> list.contains(any: 0)
}

pub fn total(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [first, ..rest] -> first + total(rest)
  }
}

pub fn busy_days(days: List(Int)) -> Int {
  list.count(days, fn(x) { x >= 5 })
}
