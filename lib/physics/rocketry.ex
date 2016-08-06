defmodule Physics.Rocketry do

  import Calcs
  import Converter
  import Physics.Laws
  import Planets


  def escape_velocity(:earth), do: earth |> escape_velocity
  def escape_velocity(:mars), do: mars |> escape_velocity
  def escape_velocity(:moon), do: moon |> escape_velocity

  def escape_velocity(planet) when is_map(planet) do
    planet
      |> calculate_escape
      |> to_km
      |> to_nearest_tenth
  end

  def orbital_speed(height) do
    newtons_gravitational_constant * Planets.earth.mass / orbital_radius(height) |> square_root
      |> to_nearest_tenth
  end

  def orbital_acceleration(height) do
    (orbital_speed(height) |> squared) / orbital_radius(height)
      |> to_nearest_tenth
  end

  def orbital_term(height) do
  4 * (:math.pi |> squared) * (orbital_radius(height) |> cubed) / (newtons_gravitational_constant * earth.mass)
    |> square_root
    |> seconds_to_hours
    |> to_nearest_tenth
  end

  def height_for_term(term) do
    # calculates de orbital radius for a term of 4 hours
    newtons_gravitational_constant * earth.mass * (squared(term * 3600)) / (4 * squared(:math.pi))
    |> cubic_root
    |> to_km
    |> to_nearest_tenth

  end


  defp calculate_escape (%{mass: mass, radius: radius}) do
    2 * newtons_gravitational_constant * mass / radius
      |> square_root
  end

  defp orbital_radius(height) do
    Planets.earth.radius + (height |> to_meters)
  end


  end
