import gleam/list
import gleam/string

pub fn find_anagrams(word: String, candidates: List(String)) -> List(String) {
  let chars = word |> string.uppercase |> string.to_graphemes
  candidates 
  |> list.filter(fn(w) { string.length(word) == string.length(w) }) 
  |> list.filter(fn(w) { w != word }) 
  |> list.filter(fn(w) { w |> string.uppercase != word })
  |> list.filter(fn(w) { is_word_an_anagram(chars, w) })
}

fn is_word_an_anagram(chars: List(String), candidate: String) -> Bool {
  let chars_candidate = candidate |> string.uppercase |> string.to_graphemes
  list.sort(chars, string.compare) == list.sort(chars_candidate, string.compare)
}