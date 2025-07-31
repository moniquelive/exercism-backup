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

  def encode(''), do: <<>>

  def encode([h | t]),
    do: <<(<<encode_nucleotide(h)::4>>), encode(t)::bitstring>>

  def decode(<<>>), do: ''

  def decode(<<h::4, t::bitstring>>),
    do: [decode_nucleotide(h) | decode(t)]
end
