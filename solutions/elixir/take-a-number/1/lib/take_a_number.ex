defmodule TakeANumber do
  def start() do
    spawn(&loop/0)
  end

  defp loop(current_number \\ 0) do
    receive do
      {:report_state, from} ->
        send(from, current_number)
        loop(current_number)

      {:take_a_number, from} ->
        next_number = current_number + 1
        send(from, next_number)
        loop(next_number)

      :stop ->
        nil

      _ ->
        loop(current_number)
    end
  end
end
