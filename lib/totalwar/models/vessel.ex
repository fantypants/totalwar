defmodule Totalwar.Models.Vessel do
  use Ecto.Schema
  import Ecto.Changeset

  schema "vessels" do
    field :name, :string
    has_many :locations, Totalwar.Models.Location, on_delete: :delete_all
    belongs_to :fleet, Totalwar.Models.Fleet

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :fleet_id])
    |> cast_assoc(:locations)
    |> validate_required([:name, :fleet_id])
  end
end
