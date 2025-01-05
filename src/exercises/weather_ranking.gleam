import gleam/order.{type Order}

pub type City {
  City(name: String, temperature: Temperature)
}

pub type Temperature {
  Celsius(Float)
  Fahrenheit(Float)
}

pub fn fahrenheit_to_celsius(f: Float) -> Float {
  { f -. 32.0 } /. 1.8
}

pub fn compare_temperature(left: Temperature, right: Temperature) -> Order {
  let left_celsius = case left {
    Celsius(c) -> c
    Fahrenheit(f) -> fahrenheit_to_celsius(f)
  }
  let right_celsius = case right {
    Celsius(c) -> c
    Fahrenheit(f) -> fahrenheit_to_celsius(f)
  }

  case left_celsius >. right_celsius {
    True -> order.Gt
    False -> case left_celsius <. right_celsius {
      True -> order.Lt
      False -> order.Eq
    }
  }
}

pub fn sort_cities_by_temperature(cities: List(City)) -> List(City) {
  case cities {
    _ -> cities
  }
}