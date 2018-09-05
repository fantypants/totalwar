defmodule Totalwar.Models.Fleet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "fleets" do
    belongs_to :country, Totalwar.Models.Country

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:country_id])
    |> validate_required([:country_id])
  end
end
