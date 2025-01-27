import gleam/io
import gleam/list
import gleam/string

pub fn main() {
  io.debug(is_isogram("six-year-old"))
}

pub fn is_isogram(phrase phrase: String) -> Bool {
  let phrase_sorted: List(String) = phrase 
  |> string.lowercase 
  |> string.replace(" ", "")
  |> string.replace("-", "")
  |> string.to_graphemes 
  |> list.sort(string.compare) 
  |> list.unique
  phrase_sorted == phrase |> string.lowercase |> string.replace(" ", "") |> string.replace("-", "") |> string.to_graphemes |> list.sort(string.compare)
}
