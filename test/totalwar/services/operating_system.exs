defmodule Totalwar.Services.OperatingSystemTest do
  use TotalwarWeb.ConnCase
  alias Totalwar.Services.OperatingSystem

  test "Module is Okay" do
    assert OperatingSystem.init_check == :ok
  end

  test "input move is valid" do
    board_size = %{"x_lim" => 10, "y_lim" => 10}
    move = %{"x" => 2, "y" => 2}
    assert OperatingSystem.check_valid_move(move, board_size) == {:valid, "Move is Valid"}
  end

  test "input move is invalid for x" do
    board_size = %{"x_lim" => 10, "y_lim" => 10}
    move = %{"x" => 11, "y" => 2}
    assert OperatingSystem.check_valid_move(move, board_size) == {:invalid, "Move is Out of Bounds"}
  end

  test "input move is invalid for y" do
    board_size = %{"x_lim" => 10, "y_lim" => 10}
    move = %{"x" => 2, "y" => 12}
    assert OperatingSystem.check_valid_move(move, board_size) == {:invalid, "Move is Out of Bounds"}
  end

  test "input move is invalid for both" do
    board_size = %{"x_lim" => 10, "y_lim" => 10}
    move = %{"x" => 12, "y" => 12}
    assert OperatingSystem.check_valid_move(move, board_size) == {:invalid, "Move is Out of Bounds"}
  end

  test "board size sets correctly" do
    assert OperatingSystem.set_board_size(%{"x" => 10, "y" => 10}) == {:ok, {10,10}}
  end

  test "board size returns invalid" do
    assert OperatingSystem.set_board_size(%{"x" => 0, "y" => 10}) == {:invalid, "Board Size Limits Not Set Correctly"}
    assert OperatingSystem.set_board_size(%{"x" => 10, "y" => 0}) == {:invalid, "Board Size Limits Not Set Correctly"}
  end

  test "board size generates correctly" do
    assert OperatingSystem.get_board_size == {:ok, 100}
  end

  test "board creates correctly" do
    assert OperatingSystem.setup_board == {:ok, {100,100}}
  end


end
