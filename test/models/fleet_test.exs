defmodule Totalwar.FleetTest do
  use Totalwar.ModelCase

  alias Totalwar.Fleet

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Fleet.changeset(%Fleet{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Fleet.changeset(%Fleet{}, @invalid_attrs)
    refute changeset.valid?
  end
end
