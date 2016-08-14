defmodule Solar do

  def power(%{classification: :X, scale: s}), do: 1000 * s
  def power(%{classification: :M, scale: s}), do: 10 * s
  def power(%{classification: :C, scale: s}), do: s
  def no_eva(flares), do: Enum.filter flares, &(power(&1) > 1000)
  def deadliest(flares) do
    Enum.map(flares, &(power(&1)))
      |> Enum.max
  end

end
