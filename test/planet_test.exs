defmodule PlanetTest do
  use ExUnit.Case
  import Planets

  setup do
    planets = [
      {:mercury, %Planets{name: "Mercury", type: :rocky, mass: 3.3e23, radius: 2.439e6}},
      {:venus, %Planets{name: "Venus", type: :rocky, mass: 4.86e24, radius: 6.05e6}},
      {:earth, %Planets{name: "Earth", type: :rocky, mass: 5.972e24, radius: 6.37e6}},
      {:mars, %Planets{name: "Mars", type: :rocky, mass: 6.41e23, radius: 3.37e6}},
      {:jupiter, %Planets{name: "Jupiter", type: :gaseous, mass: 1.89e27, radius: 7.14e7}},
      {:saturn, %Planets{name: "Saturn", type: :gaseous, mass: 5.68e26, radius: 6.02e7}},
      {:uranus, %Planets{name: "Uranus", type: :gaseous, mass: 8.68e25, radius: 2.55e7}},
      {:neptune, %Planets{name: "Neptune", type: :gaseous, mass: 1.02e26, radius: 2.47e7}}
    ]
    {:ok, planets: planets}
  end



  test "select neptune" do
    p = Planets.select[:neptune]
    assert p == %Planets{name: "Neptune", type: :gaseous, mass: 1.02e26, radius: 2.47e7, ev: 23.5}

  end

  test "escape velocity" do
    ev = escape_velocity(Planets.select[:earth])
    assert ev == Planets.select[:earth].ev
  end


end
