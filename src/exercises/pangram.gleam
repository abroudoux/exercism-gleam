import gleam/list
import gleam/string

pub fn is_pangram(sentence: String) -> Bool {
  "abcdefghijklmnopqrstuvwxyz"
  |> string.to_graphemes
  |> list.all(string.contains(string.lowercase(sentence), _))
}