defmodule Totalwar.Services.Placements do
alias Totalwar.Services.Frigate

def get_placements(position, ship) do
  case ship do
    "Frigate" ->
      calculate_position_horizontal(position, %Totalwar.Services.Frigate{})
    "Aircraft Carrier" -> %Totalwar.Services.AircraftCarrier{}
    "Destoryer" -> %Totalwar.Services.Destroyer{}
    "Patrol" -> %Totalwar.Services.Patrol{}
    "Submarine" -> %Totalwar.Services.Submarine{}
    "Tactical Boat" -> %Totalwar.Services.TacticalBoat{}
  end
end

defp calculate_position_horizontal(position, struct) do
  length = struct.length
  width = struct.width
  x_start = position.x
  y_start = position.y
  x_end = (position.x + length) -position.x
  y_end = position.y
  positions_x = Enum.to_list(x_start..x_end)
  positions_map = positions_x
    |> Enum.map(fn(x) ->
        %{x: x, y: y_end}
      end) |> IO.inspect
  {:ok, positions_map}
end

defp convert_to_atom_NOT_USED(positions, integer, operator) do
index_position = Integer.to_string(Enum.find_index(positions, fn(position) -> position == integer end))
String.to_atom(operator <> index_position)
end







end
