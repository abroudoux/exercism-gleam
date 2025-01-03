pub type TreasureChest(treasure) {
  TreasureChest(password: String, treasure: treasure)
}
pub type UnlockResult(treasure) {
  Unlocked(treasure)
  WrongPassword
}

pub fn get_treasure(
  chest: TreasureChest(treasure),
  password: String,
) -> UnlockResult(treasure) {
  case chest.password == password {
    True -> Unlocked(chest.treasure)
    False -> WrongPassword
  }
}
