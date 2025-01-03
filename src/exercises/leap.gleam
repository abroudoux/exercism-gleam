pub fn is_leap_year(year: Int) -> Bool {
  case year % 4, year % 100, year % 400 {
    0, _, _ -> True
    _, 0, _ -> False
    _, _, 0 -> True
    _, _, _ -> False
  }
}