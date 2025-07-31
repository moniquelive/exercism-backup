defmodule DNA do
  def encode_nucleotide(code_point) do
    %{
      ?\s => 0,
      ?A => 0b0001,
      ?C => 0b0010,
      ?G => 0b0100,
      ?T => 0b1000
    }[code_point]
  end

  def decode_nucleotide(encoded_code) do
    %{
      0b0000 => ?\s,
      0b0001 => ?A,
      0b0010 => ?C,
      0b0100 => ?G,
      0b1000 => ?T
    }[encoded_code]
  end

  def encode(dna),
    do:
      for(
        n <- dna,
        into: <<>>,
        do: <<encode_nucleotide(n)::4>>
      )

  def decode(dna),
    do:
      for(<<n::4 <- dna>>,
        into: '',
        do: decode_nucleotide(n)
      )
end
