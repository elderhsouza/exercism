defmodule Bob do
  @spec hey(String.t()) :: String.t()
  def hey(input) do
    trimmed = String.trim(input)

    case trimmed do
      "" ->
        "Fine. Be that way!"

      _ ->
        case String.match?(trimmed, ~r/[[:alpha:]]/u) do
          true ->
            case String.upcase(trimmed) do
              ^trimmed ->
                case String.ends_with?(trimmed, "?") do
                  true -> "Calm down, I know what I'm doing!"
                  _ -> "Whoa, chill out!"
                end

              _ ->
                case String.ends_with?(trimmed, "?") do
                  true -> "Sure."
                  _ -> "Whatever."
                end
            end

          _ ->
            case String.ends_with?(trimmed, "?") do
              true -> "Sure."
              _ -> "Whatever."
            end
        end
    end
  end
end
