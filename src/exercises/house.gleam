import gleam/io

let sentences: List(String) = [
  "the house that Jack Built."
]

pub fn recite(start_verse: Int, end_verse: Int) -> String {
  "This is " <> case start_verse, end_verse {
    _, _ -> ""
  }
}

pub fn main() {
  io.println(recite(1, 1))
}