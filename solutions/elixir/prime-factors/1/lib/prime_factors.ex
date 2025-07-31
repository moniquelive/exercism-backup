defmodule PrimeFactors do
  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest.
  """
  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(number), do: factors(number, 2, [])

  @spec factors(pos_integer, pos_integer, [pos_integer]) :: [pos_integer]
  defp factors(n, d, acc) when d * d <= n and rem(n, d) == 0, do: factors(div(n, d), d, [d | acc])
  defp factors(n, d, acc) when d * d <= n, do: factors(n, d + 1, acc)
  defp factors(n, _, acc) when n > 1, do: [n | acc] |> Enum.reverse()
  defp factors(_, _, acc), do: acc |> Enum.reverse()
end
