defmodule Totalwar.Services.Placements do
alias Totalwar.Services.Frigate

def get_placements(position, ship) do
  case ship do
    "Frigate" ->
      calculate_position(position, %Totalwar.Services.Frigate{}, "horizontal")
    "Aircraft Carrier" ->
      calculate_position(position, %Totalwar.Services.AircraftCarrier{}, "horizontal")
    "Destroyer" ->
      calculate_position(position, %Totalwar.Services.Destroyer{}, "horizontal")
    "Patrol" ->
      calculate_position(position, %Totalwar.Services.Patrol{}, "horizontal")
    "Submarine" ->
      calculate_position(position, %Totalwar.Services.Submarine{}, "horizontal")
    "Tactical Boat" ->
      calculate_position(position, %Totalwar.Services.TacticalBoat{}, "horizontal")
  end
end

defp calculate_position(position, struct, type) do
  length = struct.length
  width = struct.width
  case type do
    "horizontal" ->
      case width do
        1 ->
          single_position(position, length, width, "horizontal")
        2 ->
          double_position(position, length, width, "horizontal")
        _->
        :error
      end
    "vertical" ->
      case width do
        1 ->
          single_position(position, length, width, "vertical")
        2 ->
          double_position(position, length, width, "vertical")
        _->
        :error
      end
  end
end

defp single_position(position, length, width, type) do
  case type do
    "vertical" ->
      positions_x = Enum.to_list(position.x..((position.x + length) -position.x))
      positions_map = create_position_map(positions_x, position, "single")
      {:ok, positions_map}
    "horizontal" ->
      positions_x = Enum.to_list(position.x..((position.x + length) -position.x))
      positions_map = create_position_map(positions_x, position, "single")
      {:ok, positions_map}
  end
end

defp double_position(position, length, width, type) do
  case type  do
    "horizontal" ->
      positions_x = Enum.to_list(position.x..((position.x + length) -position.x))
      positions_map_1 = create_position_map(positions_x, position, "single")
      positions_map_2 = create_position_map(positions_x, position, "double")
      {:ok, positions_map_1 ++ positions_map_2}
    "vertical" ->
      positions_x = Enum.to_list(position.x..((position.x + length) -position.x))
      positions_map_1 = create_position_map(positions_x, position, "single")
      positions_map_2 = create_position_map(positions_x, position, "double")
      {:ok, positions_map_1 ++ positions_map_2}
  end
end

defp create_position_map(positions_x, position, type) do
  case type do
    "single" ->
      positions_x |> Enum.map(fn(x) -> %{x: x, y: position.y} end)
    "double" ->
      positions_x |> Enum.map(fn(x) -> %{x: x, y: position.y + 1} end)
  end
end









end
