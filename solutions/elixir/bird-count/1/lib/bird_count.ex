defmodule BirdCount do
  @doc """
  get today's bird count
  """
  def today([]), do: nil
  def today([head | _tail]), do: head

  @doc """
  add +1 bird to today's count
  eg:
    increment_day_count([]) -> [1]
    increment_day_count([2, 0, 4]) -> [3, 0, 4]
  """
  def increment_day_count([]), do: [1]
  def increment_day_count(birds), do: List.update_at(birds, 0, &(&1 + 1))

  @doc """
  return if there were any days in the list where there were no birds seen
  eg: 
    has_day_without_birds?([1, 2, 5, 0, 4]) -> true
    has_day_without_birds?([1, 4, 5]) -> false
  """
  def has_day_without_birds?(birds), do: 0 in birds

  @doc """
  get the total number of birds seen on all days
  eg:
    total([1, 2, 3]) -> 6
    total([1, 0, 5, 2]) -> 8
  """
  def total(birds), do: Enum.sum(birds)

  @doc """
  return how many of the days in the list were busy days (days were 5 or more birds were seen)
  eg:
    busy_days([1, 2, 5]) -> 1
    busy_days([4, 0, 2]) -> 0
    busy_days([3, 8, 0, 7]) -> 2
  """
  def busy_days(birds) do
    Enum.reduce(birds, 0, fn count, acc ->
      if count >= 5 do acc + 1 else acc end
    end)
  end
end
