defmodule BirdCount do
  def today([]), do: nil
  def today([day | _]), do: day

  def increment_day_count([]), do: [1]
  def increment_day_count([day | rest]), do: [day + 1 | rest]

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([0 | _]), do: true
  def has_day_without_birds?([_ | rest]), do: has_day_without_birds?(rest)

  def total([]), do: 0
  def total([first | rest]), do: first + total(rest)

  def busy_days([]), do: 0
  def busy_days([first | rest]) when first >= 5, do: 1 + busy_days(rest)
  def busy_days([_ | rest]), do: busy_days(rest)
end
