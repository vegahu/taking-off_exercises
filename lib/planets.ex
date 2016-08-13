defmodule Planets do

  import Physics.Rocketry

  defstruct [
    name: nil,
    type: :rocky,
    mass: 0,
    radius: 0,
    ev: 0
  ]

  defp planets do
    %Planet{name: "Mercury", type: :rocky, mass: 3.3e23, radius: 2.439e6}
    %Planet{name: "Venus", type: :rocky, mass: 4.86e24, radius: 6.05e6}
    %Planet{name: "Earth", type: :rocky, mass: 5.972e24, radius: 6.37e6}
    %Planet{name: "Mars", type: :rocky, mass: 6.41e23, radius: 3.37e6}
    %Planet{name: "Jupiter", type: :gaseous, mass: 1.89e27, radius: 7.14e7}
    %Planet{name: "Saturn", type: :gaseous, mass: 5.68e26, radius: 6.02e7}
    %Planet{name: "Uranus", type: :gaseous, mass: 8.68e25, radius: 2.55e7}
    %Planet{name: "Neptune", type: :gaseous, mass: 1.02e26, radius: 2.47e7}
  end

  def load do
    for planet <- planets, do: %{planet | ev: escape_velocity(planet)}
  end

end
