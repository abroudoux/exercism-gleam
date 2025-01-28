pub fn equilateral(a: Float, b: Float, c: Float) -> Bool {
  a == b && b == c && a != 0.0
}

pub fn isosceles(a: Float, b: Float, c: Float) -> Bool {
  a == b && b == c || a == b && a == c
}

pub fn scalene(a: Float, b: Float, c: Float) -> Bool {
  a != b && b != c
}
