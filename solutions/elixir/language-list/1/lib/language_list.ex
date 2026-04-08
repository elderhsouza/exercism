defmodule LanguageList do
  def new(), do: []

  def add(list, language), do: [language | list]

  def remove(list) do
    [_ | tail] = list
    tail
  end

  def first(list) do
    [head | _] = list
    head
  end

  def count(list) do
    Enum.count(list)
  end

  def functional_list?(list) do
    "Elixir" in list
  end
end
