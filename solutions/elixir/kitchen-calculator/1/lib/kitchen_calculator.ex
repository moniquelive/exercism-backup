defmodule KitchenCalculator do
  def get_volume({_, vol}) do
    vol
  end

  def to_milliliter({:cup, vol}), do: {:milliliter, vol * 240}
  def to_milliliter({:fluid_ounce, vol}), do: {:milliliter, vol * 30}
  def to_milliliter({:teaspoon, vol}), do: {:milliliter, vol * 5}
  def to_milliliter({:tablespoon, vol}), do: {:milliliter, vol * 15}
  def to_milliliter({:milliliter, vol}), do: {:milliliter, vol}

  def from_milliliter({:milliliter, vol}, unit = :cup), do: {unit, vol / 240}
  def from_milliliter({:milliliter, vol}, unit = :fluid_ounce), do: {unit, vol / 30}
  def from_milliliter({:milliliter, vol}, unit = :teaspoon), do: {unit, vol / 5}
  def from_milliliter({:milliliter, vol}, unit = :tablespoon), do: {unit, vol / 15}
  def from_milliliter({:milliliter, vol}, unit = :milliliter), do: {unit, vol}

  def convert(pair, to_unit) do
    pair |> to_milliliter |> from_milliliter(to_unit)
  end
end
