defmodule PlanetTest do
  use ExUnit.Case
  import Planet

  setup do
    planets = [
      {:mercury, %Planet{name: "Mercury", type: :rocky, mass: 3.3e23, radius: 2.439e6}},
      {:venus, %Planet{name: "Venus", type: :rocky, mass: 4.86e24, radius: 6.05e6}},
      {:earth, %Planet{name: "Earth", type: :rocky, mass: 5.972e24, radius: 6.37e6}},
      {:mars, %Planet{name: "Mars", type: :rocky, mass: 6.41e23, radius: 3.37e6}},
      {:jupiter, %Planet{name: "Jupiter", type: :gaseous, mass: 1.89e27, radius: 7.14e7}},
      {:saturn, %Planet{name: "Saturn", type: :gaseous, mass: 5.68e26, radius: 6.02e7}},
      {:uranus, %Planet{name: "Uranus", type: :gaseous, mass: 8.68e25, radius: 2.55e7}},
      {:neptune, %Planet{name: "Neptune", type: :gaseous, mass: 1.02e26, radius: 2.47e7}}
    ]
    {:ok, planets: planets}
  end



  test "select neptune" do
    p = Planet.select[:neptune]
    assert p == %Planet{name: "Neptune", type: :gaseous, mass: 1.02e26, radius: 2.47e7, ev: 23.5}

  end

  test "escape velocity" do
    ev = escape_velocity(Planet.select[:earth])
    assert ev == Planet.select[:earth].ev
  end


end
