defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """
  def search(numbers, key) do
    binary(numbers, key, 0, tuple_size(numbers) - 1)
  end

  defp binary(_, _, from, to) when to < from, do: :not_found

  defp binary(numbers, key, from, to) do
    avg = div(to + from, 2)
    value = elem(numbers, avg)

    cond do
      key == value -> {:ok, avg}
      key > value -> binary(numbers, key, avg + 1, to)
      key < value -> binary(numbers, key, from, avg - 1)
    end
  end
end
