defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    do_extract_from_path(data, String.split(path, "."), nil)
  end

  defp do_extract_from_path(_data, [], output), do: output

  defp do_extract_from_path(data, path, _output) do
    [path_fragment | path_rest] = path

    case data[path_fragment] do
      nil -> do_extract_from_path(data, path_rest, nil)
      _ -> do_extract_from_path(data[path_fragment], path_rest, data[path_fragment])
    end
  end

  def get_in_path(data, path) do
    Kernel.get_in(data, String.split(path, "."))
  end
end
