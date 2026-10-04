defmodule SpaceAge do
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet', or an error if 'planet' is not a planet.
  """
  @spec age_on(planet, pos_integer) :: {:ok, float} | {:error, String.t()}
  def age_on(planet, seconds) do
    to_earth_years = fn orbital_period ->
      {:ok, seconds / (31_557_600 * orbital_period)}
    end

    case planet do
      :mercury -> to_earth_years.(0.2408467)
      :venus -> to_earth_years.(0.61519726)
      :earth -> to_earth_years.(1.0)
      :mars -> to_earth_years.(1.8808158)
      :jupiter -> to_earth_years.(11.862615)
      :saturn -> to_earth_years.(29.447498)
      :uranus -> to_earth_years.(84.016846)
      :neptune -> to_earth_years.(164.79132)
      _ -> {:error, "not a planet"}
    end
  end
end
