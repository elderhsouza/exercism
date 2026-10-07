defmodule Chessboard do
  def rank_range do
    1..8
  end

  def file_range do
    ?A..?H
  end

  def ranks do
    Range.to_list(rank_range())
  end

  def files do
    Range.to_list(file_range())
    |> Enum.map(fn codepoint -> <<codepoint>> end)
  end
end
