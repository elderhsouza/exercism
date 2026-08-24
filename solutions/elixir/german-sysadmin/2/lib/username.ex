defmodule Username do
  def sanitize(username) do
    Enum.reduce(
      username, 
      [], 
      fn char, sanitized -> 
        s = case char do
          ?ä -> ~c"ae"
          ?ö -> ~c"oe"
          ?ü -> ~c"ue"
          ?ß -> ~c"ss"
          x when x in ~c"_abcdefghijklmnopqrstuvwxyz" -> [x]
          _ -> ~c""
        end
        sanitized ++ s
      end
    )
  end
end
