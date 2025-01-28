import gleam/int
import gleam/string
import gleam/list

pub fn egg_count(number: Int) -> Int {
  let binary: String = int.to_base2(number)
  let list = string.to_graphemes(binary)
  let _occurences = list.count(list, fn(val) { val == "1" })
}
