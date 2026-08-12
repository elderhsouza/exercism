defmodule BirdCount do
  @doc """
  get today's bird count
  """
  def today([]), do: nil
  def today([today | _]), do: today

  @doc """
  add +1 bird to today's count
  eg:
    increment_day_count([2, 0, 4]) -> [3 | [0, 4]] = [3, 0, 4]
  """
  def increment_day_count([]), do: [1]
  def increment_day_count([today | rest]), do: [today + 1 | rest]

  @doc """
  return if there were any days in the list where there were no birds seen
  eg: 
    has_day_without_birds?([1, 4, 3, 0, 2]) ->
    has_day_without_birds?([4, 3, 0, 2])    ->
    has_day_without_birds?([3, 0, 2])       ->
    has_day_without_birds?([0, 2])          = true

    has_day_without_birds?([1, 5, 8]) ->
    has_day_without_birds?([5, 8])    ->
    has_day_without_birds?([8])       ->
    has_day_without_birds?([])        = false
  """
  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([0 | _]), do: true
  def has_day_without_birds?([_ | rest]), do: has_day_without_birds?(rest)

  @doc """
  get the total number of birds seen on all days
  eg:
    total([4, 2, 7]) -> 4 + total([2, 7]) := 4
    total([2, [7]])  -> 2 + total([7])    := 6
    total([7])       -> 7 + total([])      = 13

  """
  def total([]), do: 0
  def total([today | rest]), do: today + total(rest)

  @doc """
  return how many of the days in the list were busy days (days were 5 or more birds were seen)
  eg:
    busy_days([5, 2, 8, 3]) -> 1 + busy_days([2, 8, 3]) := 1
    busy_days([2, [8, 3]])  -> busy_days([8, 3]])       := 1
    busy_days([8, [3]])     -> 1 + busy_days([3]])      := 2
    busy_days([3])          -> busy_days([])             = 2

    busy_days([4, 0, 2, 3]) -> busy_days([0, 2, 3]) := 0
    busy_days([0, [2, 3]])  -> busy_days([2, 3])    := 0
    busy_days([2, [3]])     -> busy_days([3])       := 0
    busy_days([3])          -> busy_days([])         = 0
  """
  def busy_days([]), do: 0
  def busy_days([today | rest]) when today>= 5, do: 1 + busy_days(rest)
  def busy_days([_ | rest]), do: busy_days(rest)
end
