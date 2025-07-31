defmodule BirdCount do
  def today(list) do
    List.first(list)
  end

  def increment_day_count([]),
    do: [1]

  def increment_day_count([day | rest]),
    do: [day + 1 | rest]

  def has_day_without_birds?(list) do
    list
    |> Enum.filter(fn el -> el == 0 end)
    |> Enum.empty?()
    |> Kernel.not()
  end

  def total(list) do
    Enum.sum(list)
  end

  def busy_days(list) do
    list
    |> Enum.filter(fn el -> el >= 5 end)
    |> Enum.count()
  end
end
