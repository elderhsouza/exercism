defmodule LibraryFees do
  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  def before_noon?(datetime) do
    datetime.hour < 12
  end

  def return_date(checkout_datetime) do
    NaiveDateTime.add(
      checkout_datetime,
      if(before_noon?(checkout_datetime), do: 28, else: 29),
      :day
    )
    |> NaiveDateTime.to_date()
  end

  def days_late(planned_return_date, actual_return_datetime) do
    actual_return_date = NaiveDateTime.to_date(actual_return_datetime)

    case Date.compare(actual_return_date, planned_return_date) do
      :gt -> Date.diff(actual_return_date, planned_return_date)
      :lt -> 0
      :eq -> 0
    end
  end

  def monday?(datetime) do
    NaiveDateTime.to_date(datetime) |> Date.day_of_week() == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    return_datetime = LibraryFees.datetime_from_string(return)

    days_late =
      days_late(
        LibraryFees.return_date(LibraryFees.datetime_from_string(checkout)),
        return_datetime
      )

    rate_with_discount =
      if monday?(return_datetime), do: rate / 2, else: rate

    (days_late * rate_with_discount) |> trunc()
  end
end
