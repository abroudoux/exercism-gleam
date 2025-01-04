import gleam/list

pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

pub fn pizza_price(pizza: Pizza) -> Int {
  case pizza {
    Margherita -> 7
    Caprese -> 9
    Formaggio -> 10
    ExtraSauce(pizza) -> 1 + pizza_price(pizza)
    ExtraToppings(pizza) -> 2 + pizza_price(pizza)
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  let price: Int = calculate_order_price(order, 0)
  case list.length(order) {
    1 -> price + 3
    2 -> price + 2
    _ -> price
  }
}

fn calculate_order_price(order: List(Pizza), acc: Int) -> Int {
  case order {
    [] -> acc
    [first, ..rest] -> {
      let acc = acc + pizza_price(first)
      calculate_order_price(rest, acc)
    }
  }
}