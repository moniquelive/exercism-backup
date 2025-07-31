defmodule Bob do
  @spec hey(String.t()) :: String.t()
  def hey(input) do
    input = input |> String.trim()

    cond do
      input |> String.length() == 0 -> "Fine. Be that way!"
      question?(input) and shout?(input) -> "Calm down, I know what I'm doing!"
      question?(input) -> "Sure."
      shout?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp question?(input), do: input |> String.ends_with?("?")
  defp shout?(input), do: !(input =~ ~r/[[:lower:]]/) && input =~ ~r/[[:upper:]]/
end
