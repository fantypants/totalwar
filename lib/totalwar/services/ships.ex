defmodule Totalwar.Services.Ships do
  alias Totalwar.Services.Ships
  alias Totalwar.Services.Submarine

  def select_ship(type) when type == "Submarine", do: %Totalwar.Services.Submarine{}
  def select_ship(type) when type == "Aircraft Carrier", do: %Totalwar.Services.AircraftCarrier{}
  def select_ship(type) when type == "Frigate", do: %Totalwar.Services.Frigate{}
  def select_ship(type) when type == "Destroyer", do: %Totalwar.Services.Destroyer{}
  def select_ship(type) when type == "Patrol", do: %Totalwar.Services.Patrol{}
  def select_ship(type) when type == "Tactical Boat", do: %Totalwar.Services.TacticalBoat{}
end
