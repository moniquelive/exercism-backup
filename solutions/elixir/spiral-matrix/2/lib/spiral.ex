defmodule Spiral do
  @doc """
  Given the dimension, return a square matrix of numbers in clockwise spiral order.
  """
  @spec matrix(dimension :: integer) :: list(list(integer))
  def matrix(0), do: []

  def matrix(dimension) do
    xy_coords = for(y <- 0..(dimension - 1), x <- 0..(dimension - 1), do: {x, y})
    map = Map.from_keys(xy_coords, 0) |> fill(dimension)

    xy_coords
    |> Enum.map(&map[&1])
    |> Enum.chunk_every(dimension)
  end

  defp fill(m, dim) do
    Enum.reduce(1..(dim * dim), {m, 0, 0, :e}, fn i, {m, x, y, dir} = _acc ->
      m = Map.update!(m, {x, y}, fn _ -> i end)

      case dir do
        :n -> if m[{x, y - 1}] == 0, do: {m, x, y - 1, dir}, else: {m, x + 1, y, :e}
        :s -> if m[{x, y + 1}] == 0, do: {m, x, y + 1, dir}, else: {m, x - 1, y, :w}
        :e -> if m[{x + 1, y}] == 0, do: {m, x + 1, y, dir}, else: {m, x, y + 1, :s}
        :w -> if m[{x - 1, y}] == 0, do: {m, x - 1, y, dir}, else: {m, x, y - 1, :n}
      end
    end)
    |> elem(0)
  end
end
