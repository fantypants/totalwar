defmodule Totalwar.Services.PlacementsTest do
  use TotalwarWeb.ConnCase
  alias Totalwar.Services.Placements

  test "ship recieves correct horizontal single placement params" do
    assert Placements.get_placements(%{x: 1, y: 1}, "Frigate") == {:ok, [%{x: 1, y: 1}, %{x: 2, y: 1}, %{x: 3, y: 1}]}
  end

  test "ship recieves correct horizontal double placement params" do
    assert Placements.get_placements(%{x: 1, y: 1}, "Aircraft Carrier") == {:ok, [
      %{x: 1, y: 1},
      %{x: 2, y: 1},
      %{x: 3, y: 1},
      %{x: 4, y: 1},
      %{x: 5, y: 1},
      %{x: 6, y: 1},
      %{x: 7, y: 1},
      %{x: 8, y: 1},
      %{x: 1, y: 2},
      %{x: 2, y: 2},
      %{x: 3, y: 2},
      %{x: 4, y: 2},
      %{x: 5, y: 2},
      %{x: 6, y: 2},
      %{x: 7, y: 2},
      %{x: 8, y: 2}
    ]}
  end

  test "ship recieves correct horizontal single placement params destroyer" do
    assert Placements.get_placements(%{x: 1, y: 1}, "Destroyer") == {:ok, [%{x: 1, y: 1}, %{x: 2, y: 1}, %{x: 3, y: 1}, %{x: 4, y: 1}]}
  end

end
