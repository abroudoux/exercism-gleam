import gleam/list
import gleam/string

pub fn hey(remark: String) -> String {
  let empty: Bool = is_remark_empty(remark)
  let yelled: Bool = is_remark_yelled(remark)
  let question: Bool = is_remark_a_question(remark)

  case remark {
    _ if empty -> "Fine. Be that way!"
    _ if yelled && question -> "Calm down, I know what I'm doing!"
    _ if yelled -> "Whoa, chill out!"
    _ if question -> "Sure."
    _ -> "Whatever."
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
  let remark_capitalized = remark
  |> string.trim
  |> string.uppercase
  remark_capitalized == remark
}

pub fn is_remark_empty(remark: String) -> Bool {
  remark
  |> string.trim
  |> string.is_empty
}