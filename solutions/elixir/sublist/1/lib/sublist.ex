defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a == b -> :equal
      contains(a, b) -> :superlist
      contains(b, a) -> :sublist
      true -> :unequal
    end
  end

  def contains([], _b), do: false
  def contains([_ | rest] = a, b), do: List.starts_with?(a, b) or contains(rest, b)
end
