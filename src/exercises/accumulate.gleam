import gleam/list

pub fn accumulate(list: List(a), fun: fn(a) -> b) -> List(b) {
  calcul_accumulate(list, [], fun)
}

fn calcul_accumulate(origin_list: List(a), new_list: List(b), fun: fn(a) -> b) -> List(b) {
  case origin_list {
    [] -> new_list |> list.reverse
    [first, ..rest] -> {
      let new_val = fun(first)
      let origin_list = rest
      let new_list = list.prepend(new_list, new_val)
      calcul_accumulate(origin_list, new_list, fun)
    }
  }
}
