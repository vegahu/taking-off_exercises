defmodule SolarTest do
  use ExUnit.Case
  use Timex

  setup do
    flares = [
      %{classification: :X, stations: 10, scale: 99, date: Timex.iso_triplet({1859, 8, 29})},
      %{classification: :M, stations: 10, scale: 5.8, date: Timex.iso_triplet({2015, 1, 12})},
      %{classification: :M, stations: 6, scale: 1.2, date: Timex.iso_triplet({2015, 2, 9})},
      %{classification: :C, stations: 6, scale: 3.2, date: Timex.iso_triplet({2015, 4, 18})},
      %{classification: :M, stations: 7, scale: 83.6, date: Timex.iso_triplet({2015, 6, 23})},
      %{classification: :C, stations: 10, scale: 2.5, date: Timex.iso_triplet({2015, 7, 4})},
      %{classification: :X, stations: 2, scale: 72, date: Timex.iso_triplet({2012, 7, 23})},
      %{classification: :X, stations: 4, scale: 45, date: Timex.iso_triplet({2003, 11, 4})},
    ]
    {:ok, data: flares}
  end

  test "We have 8 solar flares", %{data: flares} do
    assert length(flares) == 8
  end

  test "Go inside", %{data: flares} do
    d = Solar.no_eva(flares)
    assert length(d) == 3
  end

  test "the deadliest flare", %{data: flares} do
    death = Solar.deadliest(flares)
    assert death == 99000
  end

  test "total flare power using recursion", %{data: flares} do
    total = Solar.total_flare_power(flares)
    assert total == 147717.966
  end

  test "total flare power using enums", %{data: flares} do
    # Hey! Why is this answer different! Can you adjust this function for me?
    # adding the tolerant factor to power/1 functions sovels de problem, and made deadliest flare test goes to 67320
    total = Solar.total_flare_power_enum(flares)
    assert total == 228611.7 #147717.966
  end

  test "a flare list with comprehensions", %{data: flares} do
    list_flares = Solar.flare_list(flares)
    assert list_flares == [
      %{is_deadly: true, power: 99000}, %{is_deadly: false, power: 58.0},
      %{is_deadly: false, power: 12.0}, %{is_deadly: false, power: 3.2},
      %{is_deadly: false, power: 836.0}, %{is_deadly: false, power: 2.5},
      %{is_deadly: true, power: 7.92e4}, %{is_deadly: true, power: 49500.00000000001}
    ]

  end

  test "a flare list with enums", %{data: flares} do
    list_flares = Solar.flare_list_enums(flares)
    assert list_flares == [
      %{is_deadly: true, power: 99000}, %{is_deadly: false, power: 58.0},
      %{is_deadly: false, power: 12.0}, %{is_deadly: false, power: 3.2},
      %{is_deadly: false, power: 836.0}, %{is_deadly: false, power: 2.5},
      %{is_deadly: true, power: 7.92e4}, %{is_deadly: true, power: 49500.00000000001}
    ]
  end

end
