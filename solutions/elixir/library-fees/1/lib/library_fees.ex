defmodule LibraryFees do
  def datetime_from_string(string),
    do: NaiveDateTime.from_iso8601!(string)

  def before_noon?(datetime) do
    datetime
    |> NaiveDateTime.to_date()
    |> NaiveDateTime.new!(~T[12:00:00])
    |> NaiveDateTime.compare(datetime) == :gt
  end

  def return_date(checkout_datetime) do
    days = if before_noon?(checkout_datetime), do: 28, else: 29

    checkout_datetime
    |> NaiveDateTime.to_date()
    |> Date.add(days)
  end

  def days_late(planned_return_date, actual_return_datetime) do
    actual_return_datetime
    |> NaiveDateTime.to_date()
    |> Date.diff(planned_return_date)
    |> max(0)
  end

  def monday?(datetime) do
    datetime
    |> NaiveDateTime.to_date()
    |> Date.day_of_week()
    |> Kernel.==(1)
  end

  def calculate_late_fee(checkout, return, rate) do
    checkout_datetime = datetime_from_string(checkout)
    planned_return_date = return_date(checkout_datetime)
    actual_return_date = datetime_from_string(return)
    discount? = monday?(actual_return_date)
    rate = if(discount?, do: rate / 2, else: rate)

    trunc(days_late(planned_return_date, actual_return_date) * rate)
  end
end
