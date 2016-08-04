defmodule PhysicsTest do
  use ExUnit.Case
  doctest Physics

  test "Converter one works" do
    assert Converter.to_light_seconds({:miles, 1000}, precision: 5) == 0.00537
   end

  test "ConverterTwo works" do
    assert ConverterTwo.to_light_seconds({:miles, 1000}, precision: 5) == 0.00537
  end

  test "ConverterTwo works with default values" do
    assert ConverterTwo.to_light_seconds({:miles, 1000}) == 0.00537
  end

  test "Escape velocity for earth" do
   assert Physics.Rocketry.escape_velocity(:earth) == 11.2
  end

  test "Escape velocity for planet X" do
    assert Physics.Rocketry.escape_velocity(%{mass: 5.972e24, radius: 6.371e6}) == 11.2
  end

end
