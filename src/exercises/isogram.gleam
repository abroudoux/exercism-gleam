import gleam/list
import gleam/string

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

// better solution found on Exercism Community Solutions
pub fn is_isogram_(phrase phrase: String) -> Bool {
  phrase
  |> string.uppercase
  |> string.split("")
  |> list.filter(fn(item) { item != " " && item != "-" })
  |> fn(chars) { chars == list.unique(chars) }
}