defmodule Totalwar.LocationTest do
  use Totalwar.ModelCase

  alias Totalwar.Location

  @valid_attrs %{health: true, x: 42, y: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Location.changeset(%Location{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Location.changeset(%Location{}, @invalid_attrs)
    refute changeset.valid?
  end
end
