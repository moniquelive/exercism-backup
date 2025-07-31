defmodule Frequency do
  @doc """
  Count letter frequency in parallel.

  Returns a map of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t()], pos_integer) :: map
  def frequency([], _workers), do: %{}

  def frequency(texts, workers) do
    texts
    |> Task.async_stream(
      fn s ->
        Regex.replace(~r/[^[:alpha:]]/u, s |> String.downcase(), "")
        |> String.graphemes()
        |> Enum.frequencies()
      end,
      max_concurrency: workers
    )
    |> Enum.reduce(%{}, fn {:ok, m}, acc ->
      Map.merge(m, acc, fn _k, v1, v2 -> v1 + v2 end)
    end)
  end
end
