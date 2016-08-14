defmodule RocketryTest do
  use ExUnit.Case
  import Physics.Rocketry

  test "Orbital acceleration defaults to Earth" do
    x = orbital_acceleration(100)
    assert x == 9.515619587729839
  end

  test "Orbital term at 100km" do
    x = orbital_term(100)
    assert x == 1.4391662709630206
  end

  test "Orbital acceleration for Jupiter at 100km" do
    x = orbital_acceleration(Planet.select[:jupiter], 100)
    assert x == 272.5067822440311
    #assert x == 24.670096337229204
  end

  test "Orbital term at 100km for Saturn at 6000km" do
    #assert x == 4.9
    x = orbital_term(Planet.select[:saturn], 6000)
    assert x == 4.82977908991254
  end

end
