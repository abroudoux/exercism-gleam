import gleam/list

pub fn place_location_to_treasure_location(
  place_location: #(String, Int),
) -> #(Int, String) {
  case place_location {
    #(string, int) -> #(int, string)
  }
}

pub fn treasure_location_matches_place_location(
  place_location: #(String, Int),
  treasure_location: #(Int, String),
) -> Bool {
  let place_location: #(Int, String) = place_location_to_treasure_location(place_location)
  place_location == treasure_location
}

pub fn count_place_treasures(
  place: #(String, #(String, Int)),
  treasures: List(#(String, #(Int, String))),
) -> Int {
  let place_location: #(Int, String) = place_location_to_treasure_location(place.1)
  treasures
  |> list.filter(fn(item) { item.1 == place_location})
  |> list.length
}

pub fn special_case_swap_possible(
  found_treasure: #(String, #(Int, String)),
  place: #(String, #(String, Int)),
  desired_treasure: #(String, #(Int, String)),
) -> Bool {
  let place_location: #(Int, String) = place_location_to_treasure_location(place.1)

  let condition_1 = found_treasure.0 == "Brass Spyglass" && place.0 == "Abandoned Lighthouse" && desired_treasure.1 == place_location
  let condition_2 = found_treasure.0 == "Amethyst Octopus" && place.0 == "Stormy Breakwater" && desired_treasure.0 == "Crystal Crab" || desired_treasure.0 == "Glass Starfish"
  let condition_3 = found_treasure.0 == "Vintage Pirate Hat" && place.0 == "Harbor Managers Office" && desired_treasure.0 == "Model Ship in Large Bottle" || desired_treasure.0 == "Antique Glass Fishnet Float"

  case desired_treasure {
    _ if condition_1 -> True
    _ if condition_2 -> True
    _ if condition_3 -> True
    _ -> False
  }
}