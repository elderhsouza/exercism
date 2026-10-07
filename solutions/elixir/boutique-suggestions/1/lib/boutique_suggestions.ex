defmodule BoutiqueSuggestions do
  def get_combinations(tops, bottoms, options \\ []) do
    for top <- tops,
        bottom <- bottoms,
        top.price + bottom.price < Keyword.get(options, :maximum_price, 100.00),
        top.base_color != bottom.base_color do
      {top, bottom}
    end
  end
end
