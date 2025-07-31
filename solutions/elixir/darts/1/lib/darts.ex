defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    dist = :math.sqrt(x * x + y * y)

    cond do
      dist > 10 -> 0
      dist <= 1 -> 10
      dist <= 5 -> 5
      :default -> 1
    end
  end
end
