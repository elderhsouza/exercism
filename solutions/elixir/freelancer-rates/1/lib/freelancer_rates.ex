defmodule FreelancerRates do
  def daily_rate(hourly_rate), do: hourly_rate * 8.0

  def apply_discount(before_discount, discount) do
     before_discount - (before_discount * (discount / 100))
  end

  def monthly_rate(hourly_rate, discount) do
    daily_rate(hourly_rate)
    |> then(&(&1 * 22))
    |> apply_discount(discount)
    |> ceil()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    daily_rate(hourly_rate)
    |> apply_discount(discount)
    |> then(&(budget / &1))
    |> Float.floor(1)
  end
end
