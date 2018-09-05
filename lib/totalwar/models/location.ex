defmodule Totalwar.Models.Location do
  use Ecto.Schema
  import Ecto.Changeset

  schema "locations" do
    field :x, :integer
    field :y, :integer
    field :health, :boolean, default: false
    belongs_to :vessel, Totalwar.Models.Vessel
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:x, :y, :health, :vessel_id])
    |> validate_required([:x, :y, :health, :vessel_id])
  end
end
