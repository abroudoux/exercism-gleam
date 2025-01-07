import gleam/option.{type Option}

pub fn two_fer(name: Option(String)) -> String {
  "One for " <> case name {
    option.Some(name) -> name
    option.None -> "you"
  } <> ", one for me."
}
