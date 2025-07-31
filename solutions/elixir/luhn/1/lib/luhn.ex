defmodule Luhn do
  import Integer, [:is_odd]

  @doc """
  Checks if the given number is valid via the luhn formula
  """
  @spec valid?(String.t()) :: boolean
  def valid?(number) do
    number = Regex.replace(~r/\s+/, number, "")

    number =
      if number =~ ~r/[1-9]/,
        do: Regex.replace(~r/^0+/, number, ""),
        else: number

    number =~ ~r/^[[:digit:]]{2,}$/ and
      number
      |> String.reverse()
      |> String.graphemes()
      |> Stream.map(&String.to_integer/1)
      |> Enum.with_index(fn
        digit, pos when is_odd(pos) ->
          if (double = digit * 2) > 9,
            do: double - 9,
            else: double

        digit, _ ->
          digit
      end)
      |> Enum.sum()
      |> then(&(rem(&1, 10) == 0))
  end
end
