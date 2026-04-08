defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    length = :math.sqrt((x ** 2) + (y ** 2))

    cond do
      length <= 01 -> 10
      length <= 05 -> 5
      length <= 10 -> 1
      true -> 0
    end
  end
end
