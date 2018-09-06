defmodule Totalwar.Services.PlacementsTest do
  use TotalwarWeb.ConnCase
  alias Totalwar.Services.Placements

  test "ship recieves correct horizontal placement params" do
    assert Placements.get_placements(%{x: 1, y: 1}, "Frigate") == {:ok, [%{x: 1, y: 1}, %{x: 2, y: 1}, %{x: 3, y: 1}]}
  end

end
