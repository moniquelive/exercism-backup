defmodule KitchenCalculator do
  @ratios %{
    cup: 240,
    fluid_ounce: 30,
    teaspoon: 5,
    tablespoon: 15,
    milliliter: 1
  }

  def get_volume({_, vol}), do: vol
  def to_milliliter({unit, vol}), do: {:milliliter, vol * @ratios[unit]}
  def from_milliliter({:milliliter, vol}, unit), do: {unit, vol / @ratios[unit]}
  def convert(volume_pair, to_unit), do: volume_pair |> to_milliliter |> from_milliliter(to_unit)
end
