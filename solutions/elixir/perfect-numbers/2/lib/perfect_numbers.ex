defmodule PerfectNumbers do
  @doc """
  Determine the aliquot sum of the given `number`, by summing all the factors
  of `number`, aside from `number` itself.

  Based on this sum, classify the number as:

  :perfect if the aliquot sum is equal to `number`
  :abundant if the aliquot sum is greater than `number`
  :deficient if the aliquot sum is less than `number`
  """
  @spec classify(number :: integer) :: {:ok, atom} | {:error, String.t()}
  def classify(number) when number <= 0,
    do: {:error, "Classification is only possible for natural numbers."}

  def classify(number) do
    aliquot_sum = number |> factors() |> Enum.sum()

    cond do
      aliquot_sum < number -> {:ok, :deficient}
      aliquot_sum > number -> {:ok, :abundant}
      true -> {:ok, :perfect}
    end
  end

  defp factors(n),
    do: for(factor <- Range.new(1, n - 1, 1), rem(n, factor) == 0, do: factor)
end
