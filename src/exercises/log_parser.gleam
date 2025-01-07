import gleam/regexp

pub fn is_valid_line(line: String) -> Bool {
  let assert Ok(re) = regexp.from_string("[\\w+]")

  case regexp.check(re, line) {
    True -> True
    False -> False
  }
}

pub fn split_line(line: String) -> List(String) {
  let assert Ok(re) = regexp.from_string("^<[~\\*\\=-]*>$")

  case regexp.check(re, line) {
    _ -> []
  }
}

pub fn tag_with_user_name(line: String) -> String {
  todo
}
