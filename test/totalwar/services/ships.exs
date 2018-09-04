defmodule Totalwar.Services.ShipsTest do
  use TotalwarWeb.ConnCase
  alias Totalwar.Services.Ships

  test "Ship Struct sets correct" do
    assert Ships.select_ship("Submarine") == %Totalwar.Services.Submarine{length: 5, name: "Submarine", width: 1}
    assert Ships.select_ship("Aircraft Carrier") == %Totalwar.Services.AircraftCarrier{length: 8, name: "Aircraft Carrier", width: 2}
    assert Ships.select_ship("Frigate") == %Totalwar.Services.Frigate{length: 3, name: "Frigate", width: 1}
    assert Ships.select_ship("Destroyer") == %Totalwar.Services.Destroyer{length: 4, name: "Destroyer", width: 1}
    assert Ships.select_ship("Patrol") == %Totalwar.Services.Patrol{length: 2, name: "Patrol", width: 1}
    assert Ships.select_ship("Tactical Boat") == %Totalwar.Services.TacticalBoat{length: 1, name: "Tactical Boat", width: 1}
  end


end
