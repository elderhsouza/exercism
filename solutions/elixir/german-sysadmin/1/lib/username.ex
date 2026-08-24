defmodule Username do
  def sanitize(username) do
    Enum.reduce(username, [], fn char, sanitized ->
      case char do
        char when char in ~c"_abcdefghijklmnopqrstuvwxyz" -> sanitized ++ [char]
        ?ä -> sanitized ++ String.to_charlist("ae")
        ?ö -> sanitized ++ String.to_charlist("oe")
        ?ü -> sanitized ++ String.to_charlist("ue")
        ?ß -> sanitized ++ String.to_charlist("ss")
        _ -> sanitized
      end
    end)
  end
end
