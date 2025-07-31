defmodule ResistorColorTrio do
  @colors %{
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }

  @doc """
  Calculate the resistance value in ohm or kiloohm from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms}
  def label([decimal, units, zeros | _]) do
    val = (@colors[decimal] * 10 + @colors[units]) * 10 ** @colors[zeros]

    if val > 1000,
      do: {val / 1000, :kiloohms},
      else: {val, :ohms}
  end
end
