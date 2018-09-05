defmodule Totalwar.TurnTest do
  use Totalwar.ModelCase

  alias Totalwar.Turn

  @valid_attrs %{successful: true, x: 42, y: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Turn.changeset(%Turn{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Turn.changeset(%Turn{}, @invalid_attrs)
    refute changeset.valid?
  end
end
