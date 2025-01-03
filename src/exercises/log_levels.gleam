import gleam/string

pub fn message(log_line: String) -> String {
  case log_line {
    "[INFO]:" <> message -> message
    "[WARNING]:" <> message -> message
    "[ERROR]:" <> message -> message
    _ -> "Unknown"
  }
  |> string.trim
}

pub fn log_level(log_line: String) -> String {
  case log_line {
    "[INFO]:" <> _ -> "info"
    "[WARNING]:" <> _ -> "warning"
    "[ERROR]:" <> _ -> "error"
    _ -> "Unknown"
  }
}

pub fn reformat(log_line: String) -> String {
  case log_line {
    "[INFO]:" <> message -> message <> " (info)"
    "[WARNING]:" <> message -> message <> " (warning)"
    "[ERROR]:" <> message -> message <> " (error)"
    _ -> "Unknown"
  }
  |> string.trim
}