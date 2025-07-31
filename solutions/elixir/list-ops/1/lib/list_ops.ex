defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer
  def count(l), do: count(l, 0)
  defp count([], acc), do: acc
  defp count([_h | t], acc), do: count(t, acc + 1)

  @spec reverse(list) :: list
  def reverse(l), do: reverse(l, [])
  defp reverse([], acc), do: acc
  defp reverse([h | t], acc), do: reverse(t, [h | acc])

  @spec map(list, (any -> any)) :: list
  def map(l, f), do: map(l, f, [])
  defp map([], _f, acc), do: acc |> reverse()
  defp map([h | t], f, acc), do: map(t, f, [f.(h) | acc])

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f), do: filter(l, f, [])
  defp filter([], _f, acc), do: acc |> reverse()

  defp filter([h | t], f, acc),
    do: if(f.(h), do: filter(t, f, [h | acc]), else: filter(t, f, acc))

  @type acc :: any
  @spec foldl(list, acc, (any, acc -> acc)) :: acc
  def foldl(l, acc, f), do: foldl(l, acc, f, acc)
  defp foldl([], _acc, _f, result), do: result
  defp foldl([h | t], acc, f, result), do: foldl(t, acc, f, f.(h, result))

  @spec foldr(list, acc, (any, acc -> acc)) :: acc
  def foldr(l, acc, f), do: foldl(l |> reverse, acc, f)

  @spec append(list, list) :: list
  def append([], b), do: b
  def append([h | t], b), do: [h | append(t, b)]

  @spec concat([[any]]) :: [any]
  def concat([]), do: []
  def concat([h | t]), do: append(h, concat(t))
end
