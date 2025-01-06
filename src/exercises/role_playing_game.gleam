import gleam/option.{type Option}

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  case player.name {
    option.Some(name) -> name
    option.None -> "Mighty Magician"
  }
}

pub fn revive(player: Player) -> Option(Player) {
  case player.health, player.level {
    0, i if i >= 10 -> option.Some(Player(player.name, player.level, 100, option.Some(100)))
    0, _ -> option.Some(Player(player.name, player.level, 100, player.mana))
    _, _ -> option.None
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case player.mana {
    option.Some(mana) -> {
      case mana > cost {
        True -> #(Player(player.name, player.level, player.health, option.Some(mana - cost)), cost * 2)
        False -> #(player, 0)
      }
    }
    option.None -> {
      case player.health - cost <= 0 {
        True -> #(Player(player.name, player.level, 0, player.mana), 0)
        False -> #(Player(player.name, player.level, player.health - cost, player.mana), 0)
      }
    }
  }
}