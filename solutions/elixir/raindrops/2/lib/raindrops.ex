defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    str = [divby?(number, 3) && "Pling" || "",
           divby?(number, 5) && "Plang" || "",
           divby?(number, 7) && "Plong" || ""]
          |> Enum.join()
    if str == "", do: to_string(number), else: str
  end

  defp divby?(n, d) when rem(n,d) == 0, do: true
  defp divby?(_, _), do: false
end
