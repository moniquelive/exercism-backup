defmodule BirdCount do
  def today([]), do: nil
  def today([day | _]), do: day

  def increment_day_count([]), do: [1]
  def increment_day_count([day | rest]), do: [day + 1 | rest]

  def has_day_without_birds?([]), do: false

  def has_day_without_birds?([day | rest]),
    do: if(day == 0, do: true, else: has_day_without_birds?(rest))

  def total([]), do: 0
  def total([first | rest]), do: first + total(rest)

  def busy_days([]),
    do: 0

  def busy_days([first | rest]),
    do: if(first >= 5, do: 1, else: 0) + busy_days(rest)
end
