defmodule Change do
  @moduledoc """
    Determine the least number of coins to be given to the user such
    that the sum of the coins' value would equal the correct amount of change.
    It returns {:error, "cannot change"} if it is not possible to compute the
    right amount of coins. Otherwise returns the tuple {:ok, list_of_coins}

    ## Examples

      iex> Change.generate([5, 10, 15], 3)
      {:error, "cannot change"}

      iex> Change.generate([1, 5, 10], 18)
      {:ok, [1, 1, 1, 5, 10]}

  """

  @spec generate(list, integer) :: {:ok, list} | {:error, String.t()}
  def generate(_coins, target) when target < 0, do: {:error, "cannot change"}
  def generate(_coins, 0), do: {:ok, []}

  def generate(coins, target) do
    changes = 1..target |> Enum.reduce(%{0 => []}, &change_for(&1, &2, coins))
    # |> IO.inspect(label: "changes", charlists: :as_lists)

    case changes[target] do
      nil -> {:error, "cannot change"}
      change -> {:ok, change}
    end
  end

  def change_for(target, acc, coins) do
    change =
      coins
      |> Enum.filter(&acc[target - &1])
      |> Enum.map(&[&1 | acc[target - &1]])
      |> Enum.min_by(&length/1, fn -> nil end)

    Map.put(acc, target, change)
  end
end
