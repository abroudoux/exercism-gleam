import gleam/list
import gleam/string
import gleam/set.{type Set}

pub fn new_collection(card: String) -> Set(String) {
  set.new()
  |> set.insert(card)
}

pub fn add_card(collection: Set(String), card: String) -> #(Bool, Set(String)) {
  case set.contains(collection, card) {
    True -> #(True, collection)
    False -> #(False, set.insert(collection, card))
  }
}

pub fn trade_card(
  my_card: String,
  their_card: String,
  collection: Set(String),
) -> #(Bool, Set(String)) {
  case set.contains(collection, my_card), set.contains(collection, their_card) {
    False, _ -> #(False, collection)
    True, True -> #(False, collection)
    True, False -> #(True, set.insert(collection, their_card) |> set.delete(my_card))
  }
}

pub fn boring_cards(collections: List(Set(String))) -> List(String) {
  case collections {
    [set1, set2, ..] -> {
      set.intersection(set1, set2)
      |> set.to_list
    }
    _ -> []
  }
}

pub fn total_cards(collections: List(Set(String))) -> Int {
  case collections {
    [set1, set2] -> {
      set.union(set1, set2)
      |> set.to_list
      |> list.length
    }
    [_, _, ..] -> todo
    _ -> 0
  }
}

pub fn shiny_cards(collection: Set(String)) -> Set(String) {
  collection
  |> set.filter(fn(card) {
    string.starts_with(card, "Shiny ")
  })
}
