defmodule Lasagna do
  def expected_minutes_in_oven, do: 40

  def remaining_minutes_in_oven(m), do: expected_minutes_in_oven() - m

  def preparation_time_in_minutes(l), do: l * 2

  def total_time_in_minutes(l, m), do: preparation_time_in_minutes(l) + m

  def alarm, do: "Ding!"
end
