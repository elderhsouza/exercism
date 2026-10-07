defmodule Bob do
  @spec hey(String.t()) :: String.t()
  def hey(input) do
    input = String.trim(input)

    silent? = fn str -> str == "" end
    yelling? = fn str -> String.upcase(str) == str and String.match?(str, ~r/[[:alpha:]]/u) end
    asking? = fn str -> String.ends_with?(str, "?") end

    cond do
      silent?.(input) -> "Fine. Be that way!"
      yelling?.(input) and asking?.(input) -> "Calm down, I know what I'm doing!"
      yelling?.(input) -> "Whoa, chill out!"
      asking?.(input) -> "Sure."
      true -> "Whatever."
    end
  end
end
