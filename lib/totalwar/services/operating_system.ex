defmodule Totalwar.Services.OperatingSystem do
  alias Totalwar.Services.OperatingSystem

  def init_check() do
    :ok
  end

  def check_move_is_hit(%{"x" => x_loc, "y" => y_loc}, hit_locations) do
    move = %{x: x_loc, y: y_loc}
    with true <- Enum.any?(hit_locations, fn(positions) -> positions == move end) do
      check_hit_intersection(move, hit_locations)
    else
      false -> register_hit(move, false)
    end
  end

  defp register_hit(hit_location, valid_hit?) do
    case valid_hit? do
      true ->
        {:ok, %{x: hit_location.x, y: hit_location.y, successful: true}}
      false ->
        {:ok, %{x: hit_location.x, y: hit_location.y, successful: false}}
    end
  end

  def check_hit_intersection(move, hit_locations) do
    hit_location = hit_locations |> Enum.reject(fn(positions) -> positions !== move end) |> List.first
    register_hit(hit_location, true)
  end

  def check_valid_move(%{"x" => pos_x, "y" => pos_y}, %{"x_lim" => x_size, "y_lim" => y_size}) do
    x_valid? = check_bounds(pos_x, x_size)
    y_valid? = check_bounds(pos_y, y_size)
    case {x_valid?, y_valid?} do
      {:valid, :valid} ->
        {:valid, "Move is Valid"}
      _->
      {:invalid, "Move is Out of Bounds"}
    end
  end

  def setup_board do
    size = elem(get_board_size, 1)
    set_board_size(%{"x" => size, "y" => size})
  end

  def get_board_size() do
    n=100
    size_limit = 100
    if size_limit <= 100 do
      case is_integer(size_limit) do
        true ->
          {:ok, size_limit}
        false ->
          :error
      end
    else
      :error
    end
  end

  def set_board_size(%{"x" => x, "y" => y}) do
    board_size = check_board_limits({x,y})
    case board_size do
      {:ok, board_size} ->
        {:ok, board_size}
      {:invalid, messsage} ->
        {:invalid, "Board Size Limits Not Set Correctly"}
    end
  end

  defp check_board_limits({x,y}) do
    case {x,y} do
      {0,_y} ->
        {:invalid, "X invalid"}
      {_x, 0} ->
        {:invalid, "Y invalid"}
      _->
      {:ok, {x,y}}
    end
  end

  defp check_bounds(pos, limit) do
    if pos <= limit do
      :valid
    else
      :invalid
    end
  end
end
