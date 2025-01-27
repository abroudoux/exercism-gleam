import gleam/result
import gleam/bit_array
import gleam/string
import gleam/list

pub type Nucleotide {
  Adenine
  Cytosine
  Guanine
  Thymine
}

pub fn encode_nucleotide(nucleotide: Nucleotide) -> Int {
  case nucleotide {
    Adenine -> 0b00
    Cytosine -> 0b01
    Guanine -> 0b10
    Thymine -> 0b11
  }
}

pub fn decode_nucleotide(nucleotide: Int) -> Result(Nucleotide, Nil) {
  case nucleotide {
    0b00 -> Ok(Adenine)
    0b01 -> Ok(Cytosine)
    0b10 -> Ok(Guanine)
    0b11 -> Ok(Thymine)
    _ -> Error(Nil)
  }
}

pub fn encode(dna: List(Nucleotide)) -> BitArray {
  // need to be fixed
  todo

  dna
  |> list.map(fn(x) { encode_nucleotide(x) })
  |> list.fold(<<>>, fn(acc, int) { <<acc:bits, int:32>> })
}

pub fn decode(dna: BitArray) -> Result(List(Nucleotide), Nil) {
  // need to be fixed
  todo

  use dna_string <- result.try(bit_array.to_string(dna))

  dna_string
  |> string.to_graphemes
  |> list.try_map(fn(nucleotide) {
    case nucleotide {
      "Adenine" -> Ok(Adenine)
      "Cysosine" -> Ok(Cytosine)
      "Guanine" -> Ok(Guanine)
      "Thymine" -> Ok(Thymine)
      _ -> Error(Nil)
    }
  })
}