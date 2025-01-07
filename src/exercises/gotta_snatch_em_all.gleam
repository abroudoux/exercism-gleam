import gleam/list
import gleam/string
import gleam/set.{type Set}
import gleam/result

pub fn new_collection(card: String) -> Set(String) {
  set.new()
  |> set.insert(card)
}

// better solution found on Exercism Community Solutions
pub fn new_collection_(card: String) -> Set(String) {
  set.from_list([card])
}

pub fn add_card(collection: Set(String), card: String) -> #(Bool, Set(String)) {
  case set.contains(collection, card) {
    True -> #(True, collection)
    False -> #(False, set.insert(collection, card))
  }
}

// better solution found on Exercism Community Solutions
pub fn add_card_(collection: Set(String), card: String) -> #(Bool, Set(String)) {
  #(set.contains(collection, card), set.insert(collection, card))
}

pub fn trade_card(
  my_card: String,
  their_card: String,
  collection: Set(String),
) -> #(Bool, Set(String)) {
  let updated_collection: Set(String) = set.insert(collection, their_card) |> set.delete(my_card)
  case set.contains(collection, my_card), set.contains(collection, their_card) {
    False, _ -> #(False, updated_collection)
    True, True -> #(False, updated_collection)
    True, False -> #(True, updated_collection)
  }
}

pub fn boring_cards(collections: List(Set(String))) -> List(String) {
  case collections {
    [set1, set2] -> {
      set.intersection(set1, set2)
    }
    [set1, set2, ..rest] -> set.intersection(set.from_list(boring_cards([set1, set2])), set.from_list(boring_cards(rest)))
    _ -> set.new()
  }
  |> set.to_list
}

// better solution found on Exercism Community Solutions
pub fn boring_cards_(collections: List(Set(String))) -> List(String) {
  list.reduce(collections, set.intersection) |> result.unwrap(set.new()) |> set.to_list
}

pub fn total_cards(collections: List(Set(String))) -> Int {
  case collections {
    [set1, set2] -> {
      set.union(set1, set2)
      |> set.to_list
      |> list.length
    }
    [set1, set2, ..rest] -> total_cards([set1, set2]) + total_cards(rest)
    _ -> 0
  }
}

// better solution found on Exercism Community Solutions
pub fn total_cards_(collections: List(Set(String))) -> Int {
  list.fold(collections, set.new(), set.union) |> set.size
}

pub fn shiny_cards(collection: Set(String)) -> Set(String) {
  collection
  |> set.filter(fn(card) {
    string.starts_with(card, "Shiny ")
  })
}

// better solution found on Exercism Community Solutions
pub fn shiny_cards_(collection: Set(String)) -> Set(String) {
  set.to_list(collection) |> list.filter(fn(card) {string.starts_with(card, "Shiny ")}) |> set.from_list
}