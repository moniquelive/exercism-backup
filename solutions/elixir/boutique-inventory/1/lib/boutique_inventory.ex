defmodule BoutiqueInventory do
  def sort_by_price(inventory),
    do: Enum.sort_by(inventory, & &1.price)

  def with_missing_price(inventory),
    do: Enum.filter(inventory, &(!&1.price))

  def update_names(inventory, old_word, new_word),
    do:
      Enum.map(
        inventory,
        &put_in(&1, [:name], String.replace(&1[:name], old_word, new_word))
      )

  def increase_quantity(item, count),
    do: %{
      item
      | quantity_by_size:
          item[:quantity_by_size]
          |> Enum.map(fn {k, v} -> {k, v + count} end)
          |> Enum.into(%{})
    }

  def total_quantity(item),
    do:
      item[:quantity_by_size]
      |> Map.values()
      |> Enum.sum()
end
