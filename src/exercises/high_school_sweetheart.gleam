import gleam/io
import gleam/string
import gleam/list

pub fn first_letter(name: String) {
  name
  |> string.trim
  |> string.first
}

pub fn initial(name: String) {
  case first_letter(name) {
    Ok(char) -> char |> string.uppercase |> string.append(".")
    _ -> ""
  }
}

pub fn initials(full_name: String) {
  full_name
  |> string.split(on: " ")
  |> list.map(fn(str) { initial(str) })
  |> string.concat
}

pub fn pair(full_name1: String, full_name2: String) {
  //      ******       ******
  //    **      **   **      **
  //  **         ** **         **
  // **            *            **
  // **                         **
  // **     X. X.  +  X. X.     **
  //  **                       **
  //    **                   **
  //      **               **
  //        **           **
  //          **       **
  //            **   **
  //              ***
  //               *
  todo
}