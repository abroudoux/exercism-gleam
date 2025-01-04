import gleam/dict.{type Dict}

pub type ScoreBoard =
  Dict(String, Int)

pub fn create_score_board() -> ScoreBoard {
  let score_board: ScoreBoard = dict.new()
  let score_board_updated = dict.insert(score_board, "The Best Ever", 1_000_000)
  score_board_updated
}

pub fn add_player(
  score_board: ScoreBoard,
  player: String,
  score: Int,
) -> ScoreBoard {
  let _: ScoreBoard = dict.insert(score_board, player, score)
}

pub fn remove_player(score_board: ScoreBoard, player: String) -> ScoreBoard {
  case dict.get(score_board, player) {
    Ok(_) -> dict.delete(score_board, player)
    _ -> score_board
  }
}

pub fn update_score(
  score_board: ScoreBoard,
  player: String,
  points: Int,
) -> ScoreBoard {
  case dict.get(score_board, player) {
    Ok(current_score) -> dict.insert(score_board, player, current_score + points)
    Error(_) -> score_board
  }
}

pub fn apply_monday_bonus(score_board: ScoreBoard) -> ScoreBoard {
  score_board
  |> dict.map_values(fn(_, value) { value + 100 })
}
