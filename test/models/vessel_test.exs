defmodule Totalwar.VesselTest do
  use Totalwar.ModelCase

  alias Totalwar.Vessel

  @valid_attrs %{name: "some name"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Vessel.changeset(%Vessel{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Vessel.changeset(%Vessel{}, @invalid_attrs)
    refute changeset.valid?
  end
end
