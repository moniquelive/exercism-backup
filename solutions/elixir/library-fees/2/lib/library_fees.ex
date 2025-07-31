defmodule LibraryFees do
  def datetime_from_string(string),
    do: NaiveDateTime.from_iso8601!(string)

  def before_noon?(datetime),
    do: datetime.hour < 12

  def return_date(checkout_datetime),
    do:
      Date.add(
        checkout_datetime,
        (before_noon?(checkout_datetime) && 28) || 29
      )

  def days_late(planned_return_date, actual_return_datetime),
    do: Date.diff(actual_return_datetime, planned_return_date) |> max(0)

  def monday?(datetime),
    do: Date.day_of_week(datetime) == 1

  def calculate_late_fee(checkout, return, rate),
    do:
      calculate_late_fee_p(
        return_date(datetime_from_string(checkout)),
        datetime_from_string(return),
        (monday?(datetime_from_string(return)) && rate / 2) || rate
      )

  defp calculate_late_fee_p(deadline_date, actual_return_date, rate),
    do: (rate * days_late(deadline_date, actual_return_date)) |> trunc()
end
