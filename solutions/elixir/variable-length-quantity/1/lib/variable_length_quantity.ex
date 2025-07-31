defmodule VariableLengthQuantity do
  import Bitwise

  @doc """
  Encode integers into a bitstring of VLQ encoded bytes
  """
  @spec encode(integers :: [integer]) :: binary
  def encode(integers) when is_list(integers) do
    for n <- integers,
        into: <<>>,
        do: enc_int(n)
  end

  @doc """
  Decode a bitstring of VLQ encoded bytes into a series of integers
  """
  @spec decode(bytes :: binary) :: {:ok, [integer]} | {:error, String.t()}
  def decode(<<bytes::8>>) when (bytes &&& 0x80) == 0x80, do: {:error, "incomplete sequence"}

  def decode(bytes),
    do:
      {:ok,
       :binary.bin_to_list(bytes)
       |> Enum.chunk_while(
         [],
         &if((&1 &&& 0x80) == 0,
           do: {:cont, Enum.reverse([&1 | &2]), []},
           else: {:cont, [&1 | &2]}
         ),
         &if(&1 == [],
           do: {:cont, []},
           else: {:cont, Enum.reverse(&1), []}
         )
       )
       |> Enum.map(fn e ->
         e
         |> Enum.map(&(&1 &&& 0x7F))
         |> dec_int()
       end)}

  defp dec_int([a]), do: :binary.decode_unsigned(<<0::1, a::7>>)
  defp dec_int([a, b]), do: :binary.decode_unsigned(<<0::2, a::7, b::7>>)
  defp dec_int([a, b, c]), do: :binary.decode_unsigned(<<0::11, a::7, b::7, c::7>>)
  defp dec_int([a, b, c, d]), do: :binary.decode_unsigned(<<0::4, a::7, b::7, c::7, d::7>>)
  defp dec_int([a, b, c, d, e]), do: :binary.decode_unsigned(<<a::4, b::7, c::7, d::7, e::7>>)

  defp enc_int(int) do
    with <<a::4, b::7, c::7, d::7, e::7>> <- <<int::32>> do
      [a, b, c, d]
      |> Enum.drop_while(&(&1 == 0))
      |> Enum.map(&<<0x80 ||| &1>>)
      |> Enum.concat([<<e>>])
      |> Enum.into(<<>>)
    end
  end
end
