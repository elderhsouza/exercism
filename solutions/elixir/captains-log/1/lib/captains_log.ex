defmodule CaptainsLog do
  @planetary_classes ["D", "H", "J", "K", "L", "M", "N", "R", "T", "Y"]

  def random_planet_class() do
    Enum.random(@planetary_classes)
  end

  def random_ship_registry_number() do
    "NCC-#{(1000 + :rand.uniform() * 8999) |> trunc}"
  end

  def random_stardate() do
    41000 + :rand.uniform() * 1000
  end

  def format_stardate(stardate) do
    :io_lib.format("~.*..f", [1, stardate]) |> to_string()
  end
end
