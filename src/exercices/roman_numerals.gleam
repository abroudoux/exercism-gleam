import gleam/io

pub fn main() {
  io.println(convert(402))
}

pub fn convert(number: Int) -> String {
  case number {
    i if i >= 1000 -> "M" <> convert(number - 1000)
    i if i >= 900 -> "CM" <> convert(number - 900)
    i if i >= 500 -> "D" <> convert(number - 500)
    i if i >= 400 -> "CD" <> convert(number - 400)
    i if i >= 100 -> "C" <> convert(number - 100)
    i if i >= 90 -> "XC" <> convert(number - 90)
    i if i >= 50 -> "L" <> convert(number - 50)
    i if i >= 40 -> "XL" <> convert(number - 40)
    i if i >= 10 -> "X" <> convert(number - 10)
    i if i == 9 -> "IX" <> convert(number - 9)
    i if i >= 5 -> "V" <> convert(number - 5)
    i if i == 4 -> "IV" <> convert(number - 4)
    i if i >= 1 -> "I" <> convert(number - 1)
    _ -> ""
  }
}