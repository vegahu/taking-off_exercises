
#This module needs to be a struct using this data:


# I need this put into a struct that defines the above fields *as well as*
# Escape Velocity, which we'll be calculating on the fly.

# After the struct is created, please create a function called `load`
# that returns all the planets *as well as* sets the Escape Velocity (`ev`)
# on each planet's struct. Extra points if you use a comprehension.

# Finally, I want each planet to be accessible with a key: earth = Planet.select[:earth]


defmodule Planets do

  import Converter
  import Calcs
  import Physics.Laws

  defstruct [
    name: nil,
    type: :rocky,
    mass: 0,
    radius: 0,
    ev: 0
  ]

  defp planets do
    [
      {:mercury, %Planets{name: "Mercury", type: :rocky, mass: 3.3e23, radius: 2.439e6}},
      {:venus, %Planets{name: "Venus", type: :rocky, mass: 4.86e24, radius: 6.05e6}},
      {:earth, %Planets{name: "Earth", type: :rocky, mass: 5.972e24, radius: 6.37e6}},
      {:mars, %Planets{name: "Mars", type: :rocky, mass: 6.41e23, radius: 3.37e6}},
      {:jupiter, %Planets{name: "Jupiter", type: :gaseous, mass: 1.89e27, radius: 7.14e7}},
      {:saturn, %Planets{name: "Saturn", type: :gaseous, mass: 5.68e26, radius: 6.02e7}},
      {:uranus, %Planets{name: "Uranus", type: :gaseous, mass: 8.68e25, radius: 2.55e7}},
      {:neptune, %Planets{name: "Neptune", type: :gaseous, mass: 1.02e26, radius: 2.47e7}}
    ]
  end

  def select, do: for planet <- planets, do: planet |> set_ev
  # Se corresponde con la función load solicitada

  def escape_velocity(planet) do
    2 * newtons_gravitational_constant * planet.mass / planet.radius
      |> square_root
      |> to_km
      |> to_nearest_tenth
  end

  defp set_ev({name, planet}) do
    # Es necesaria para que el select sea select/0
    {name, %{planet | ev: escape_velocity(planet)}}
  end

end
