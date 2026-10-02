defmodule EliudsEggs do
  @doc """
  Given the number, count the number of eggs.
  """
  @spec egg_count(number :: integer()) :: non_neg_integer()
  def egg_count(number) do
    number
    |> Integer.to_string(2)
    |> String.split("", trim: true)
    |> Enum.reduce(0, fn bit, acc -> if bit == "1", do: acc + 1, else: acc end)
  end
end
