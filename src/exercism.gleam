import gleam/io
import gleam/list
import gleam/string

pub fn find_anagrams(word: String, candidates: List(String)) -> List(String) {
  let chars: List(String) = get_characters(word, [])
  let _: List(String) = find_anagrams_(word, candidates, [], chars)
}

fn find_anagrams_(word: String, candidates: List(String), anagrams: List(String), chars: List(String)) -> List(String) {
  case candidates {
    [head, ..tail] -> {
      case string.length(word) == string.length(head) {
        True -> {
          case is_word_an_anagram(word, chars) {
            True -> {
              find_anagrams_(word, tail, [head, ..anagrams], chars)
            }
            False -> {
              find_anagrams_(word, tail, anagrams, chars)
            }
          }
        }
        False -> find_anagrams_(word, tail, anagrams, chars)
      }
    }
    _ -> anagrams
  }
}

fn is_word_an_anagram(word: String, characters: List(String)) -> Bool {
  case string.pop_grapheme(word) {
    Ok(#(first_char, _)) -> {
      case list.contains(characters, first_char) {
        True -> is_word_an_anagram(return_string_without_first_char(word), characters)
        False -> False
      }
    }
    _ -> False
  }
}
 
fn get_characters(word: String, chars: List(String)) -> List(String) {
  case string.length(word) {
    i if i >= 1 -> {
      let first_char: String = return_first_char(word)
      let chars: List(String) = [first_char, ..chars, ]
      get_characters(return_string_without_first_char(word), chars)
    }
    _ -> chars
  }
}

fn return_first_char(str: String) -> String {
  case string.pop_grapheme(str) {
    Ok(#(first_char, _)) -> first_char
    _ -> ""
  }
}

fn return_string_without_first_char(str: String) -> String {
  case string.pop_grapheme(str) {
    Ok(#(_, tail)) -> tail
    _ -> ""
  }
}

pub fn main() {
  let word: String = "stone"
  let candidates: List(String) = ["stone", "tones", "banana", "tons", "notes", "Seton"]
  io.debug(find_anagrams(word, candidates))
}