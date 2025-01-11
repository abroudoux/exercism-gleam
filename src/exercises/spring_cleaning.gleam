import gleam/list
import gleam/string

pub fn extract_error(problem: Result(a, b)) -> b {
  let assert Error(error) = problem
  error
}

pub fn remove_team_prefix(team: String) -> String {
  let assert Ok(#(_, tail)) = string.split_once(team, " ")
  tail
}

pub fn split_region_and_team(combined: String) -> #(String, String) {
  let list = string.split(combined, ",")
  let assert Ok(team) = list.last(list)
  let assert Ok(region) = list.first(list)
  let team_name = remove_team_prefix(team)

  #(region, team_name)
}
