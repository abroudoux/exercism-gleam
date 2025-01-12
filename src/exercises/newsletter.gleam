import gleam/list
import gleam/string
import simplifile

pub fn read_emails(path: String) -> Result(List(String), Nil) {
  case simplifile.read(path) {
    Ok(lines) -> {
      let email_list = 
        lines
        |> string.split("\n")
        |> list.filter(fn(email) { string.trim(email) != "" })
      Ok(email_list)
    }
    Error(_) -> Error(Nil)
  }
}

pub fn create_log_file(path: String) -> Result(Nil, Nil) {
  case simplifile.create_file(path) {
    Ok(_) -> Ok(Nil)
    Error(_) -> Error(Nil)
  }
}

pub fn log_sent_email(path: String, email: String) -> Result(Nil, Nil) {
  case simplifile.append(path, email <> "\n") {
    Ok(_) -> Ok(Nil)
    Error(_) -> Error(Nil)
  }
}

pub fn send_newsletter(
  emails_path: String,
  log_path: String,
  send_email: fn(String) -> Result(Nil, Nil),
) -> Result(Nil, Nil) {
  case read_emails(emails_path) {
    Ok(emails) -> {
      let _ = create_log_file(log_path)
      list.try_each(emails, fn(email) {
        case send_email(email) {
          Ok(_) -> log_sent_email(log_path, email)
          Error(_) -> Ok(Nil)
        }
      })
    }
    Error(_) -> Error(Nil)
  }
}
