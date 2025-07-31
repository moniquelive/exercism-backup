defmodule LinkedList do
  @opaque t :: tuple()

  @doc """
  Construct a new LinkedList
  """
  @spec new() :: t
  def new() do
    {}
  end

  @doc """
  Push an item onto a LinkedList
  """
  @spec push(t, any()) :: t
  def push(list, elem), do: list |> Tuple.insert_at(0, elem)

  @doc """
  Counts the number of elements in a LinkedList
  """
  @spec count(t) :: non_neg_integer()
  def count(list), do: tuple_size(list)

  @doc """
  Determine if a LinkedList is empty
  """
  @spec empty?(t) :: boolean()
  def empty?({}), do: true
  def empty?(_), do: false

  @doc """
  Get the value of a head of the LinkedList
  """
  @spec peek(t) :: {:ok, any()} | {:error, :empty_list}
  def peek({}), do: {:error, :empty_list}
  def peek(list), do: {:ok, list |> elem(0)}

  @doc """
  Get tail of a LinkedList
  """
  @spec tail(t) :: {:ok, t} | {:error, :empty_list}
  def tail({}), do: {:error, :empty_list}
  def tail(list), do: {:ok, list |> Tuple.delete_at(0)}

  @doc """
  Remove the head from a LinkedList
  """
  @spec pop(t) :: {:ok, any(), t} | {:error, :empty_list}
  def pop({}), do: {:error, :empty_list}
  def pop(list), do: {:ok, list |> elem(0), list |> Tuple.delete_at(0)}

  @doc """
  Construct a LinkedList from a stdlib List
  """
  @spec from_list(list()) :: t
  def from_list(list), do: List.to_tuple(list)

  @doc """
  Construct a stdlib List LinkedList from a LinkedList
  """
  @spec to_list(t) :: list()
  def to_list(list), do: Tuple.to_list(list)

  @doc """
  Reverse a LinkedList
  """
  @spec reverse(t) :: t
  def reverse(list, acc \\ {})
  def reverse({}, acc), do: acc
  def reverse(list, acc), do: reverse(list |> Tuple.delete_at(0), push(acc, list |> elem(0)))
end
