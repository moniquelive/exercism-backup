defmodule FreelancerRates do
  @spec daily_rate(float) :: float
  def daily_rate(hourly_rate),
    do: 8.0 * hourly_rate

  @spec apply_discount(float, float) :: float
  def apply_discount(before_discount, discount),
    do: before_discount * (1 - discount / 100)

  @spec monthly_rate(float, float) :: integer
  def monthly_rate(hourly_rate, discount),
    do: (daily_rate(hourly_rate) * 22) |> apply_discount(discount) |> ceil

  @spec days_in_budget(float, float, float) :: float
  def days_in_budget(budget, hourly_rate, discount) do
    (budget /
       (hourly_rate
        |> daily_rate
        |> apply_discount(discount)))
    |> Float.floor(1)
  end
end
