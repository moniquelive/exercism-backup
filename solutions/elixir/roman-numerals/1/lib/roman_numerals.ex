defmodule RomanNumerals do
  @keys [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
  @values ~w[M CM D CD C XC L XL X IX V IV I]

  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) when number < 1, do: ""

  def numeral(number) do
    i = Enum.find_index(@keys, &(number >= &1))
    k = Enum.at(@keys, i)
    v = Enum.at(@values, i)
    v <> numeral(number - k)
  end
end
