pub type Coach {
  Coach(
    name: String,
    former_player: Bool,
  )
}

pub type Stats {
  Stats(
    wins: Int,
    losses: Int
  )
}

pub type Team {
  Team(
    name: String,
    coach: Coach,
    stats: Stats
  )
}

pub fn create_coach(name: String, former_player: Bool) -> Coach {
  Coach(name, former_player)
}

pub fn create_stats(wins: Int, losses: Int) -> Stats {
  Stats(wins, losses)
}

pub fn create_team(name: String, coach: Coach, stats: Stats) -> Team {
  Team(name, coach, stats)
}

pub fn replace_coach(team: Team, coach: Coach) -> Team {
  let team = Team(..team, coach: coach)
  team
}

pub fn is_same_team(home_team: Team, away_team: Team) -> Bool {
  {home_team.stats == away_team.stats} && {home_team.name == away_team.name} && {home_team.coach == away_team.coach}
}

pub fn root_for_team(team: Team) -> Bool {
  team.name == "Chicago Bulls" || team.coach.name == "Gregg Popovich" || team.coach.former_player || team.stats.wins >= 60 || team.stats.losses > team.stats.wins
}