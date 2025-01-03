import gleam/string.{trim}

pub fn message(log_line: String) -> String {
  case log_line {
    "[INFO]:" <> rest -> trim(rest)
    "[WARNING]:" <> rest -> trim(rest)
    "[ERROR]:" <> rest -> trim(rest)
    _ -> "Unknown"
  }
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
    "[INFO]:" <> rest -> trim(rest) <> " (info)"
    "[WARNING]:" <> rest -> trim(rest) <> " (warning)"
    "[ERROR]:" <> rest -> trim(rest) <> " (error)"
    _ -> "Unknown"
  }
}