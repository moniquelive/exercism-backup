defmodule AllYourBase do
  @doc """
  Given a number in input base, represented as a sequence of digits, converts it to output base,
  or returns an error tuple if either of the bases are less than 2
  """

  @spec convert(list, integer, integer) :: {:ok, list} | {:error, String.t()}
  def convert(_, _, output_base) when output_base < 2, do: {:error, "output base must be >= 2"}
  def convert(_, input_base, _) when input_base < 2, do: {:error, "input base must be >= 2"}

  def convert(digits, input_base, output_base) do
    if !Enum.all?(digits, &(0 <= &1 and &1 < input_base)) do
      {:error, "all digits must be >= 0 and < input base"}
    else
      {:ok,
       digits
       |> Enum.reverse()
       |> to_int(input_base, 0)
       |> to_base(output_base, [])}
    end
  end

  defp to_int([], _, _), do: 0
  defp to_int([h | t], b, e), do: h * b ** e + to_int(t, b, e + 1)

  defp to_base(0, _, []), do: [0]
  defp to_base(0, _, acc), do: acc
  defp to_base(n, b, acc), do: to_base(div(n, b), b, [rem(n, b) | acc])
end
