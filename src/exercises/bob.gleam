import gleam/io
import gleam/list
import gleam/string

pub fn main() {
  io.debug(contains_letter(":) ?"))
  io.debug(is_remark_a_question(":) ?"))
  io.debug(is_remark_yelled(":) ?"))
  io.debug(is_remark_empty(":) ?"))
}

pub fn hey(remark: String) -> String {
  case contains_letter(remark), is_remark_a_question(remark), is_remark_yelled(remark), is_remark_empty(remark) {
    _, _, _, True -> "Fine. Be that way!"
    True, True, True, False -> "Calm down, I know what I'm doing!"
    True, False, True, False -> "Whoa, chill out!"
    _, True, _, False -> "Sure."
    _, _, _, _ -> "Whatever."
  }
}

pub fn contains_letter(remark: String) -> Bool {
  remark
  |> string.to_graphemes
  |> list.any(fn(char) {
    string.lowercase(char) != string.uppercase(char)
  })
}

pub fn is_remark_a_question(remark: String) -> Bool {
  remark
  |> string.trim
  |> string.ends_with("?")
}

pub fn is_remark_yelled(remark: String) -> Bool {
  let remark_capitalized = string.uppercase(string.trim(remark))
  remark_capitalized == remark
}

pub fn is_remark_empty(remark: String) -> Bool {
  remark
  |> string.trim
  |> string.is_empty
}