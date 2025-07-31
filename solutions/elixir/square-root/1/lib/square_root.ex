defmodule SquareRoot do
  use Bitwise

  @doc """
  Calculate the integer square root of a positive integer
  """
  @spec calculate(radicand :: pos_integer) :: pos_integer
  def calculate(radicand) do
    reduce_d(1 <<< 30, radicand)
    |> reduce_c(radicand, 0)
  end

  defp reduce_d(d, n) when d <= n, do: d
  defp reduce_d(d, n), do: reduce_d(d >>> 2, n)

  defp reduce_c(d, _x, c) when d == 0, do: c

  defp reduce_c(d, x, c) do
    if x >= c + d,
      do: reduce_c(d >>> 2, x - (c + d), (c >>> 1) + d),
      else: reduce_c(d >>> 2, x, c >>> 1)
  end
end
