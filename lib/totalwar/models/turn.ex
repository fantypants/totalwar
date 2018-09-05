defmodule Totalwar.Models.Turn do
  use Ecto.Schema
  import Ecto.Changeset

  schema "turns" do
    field :x, :integer
    field :y, :integer
    field :successful, :boolean, default: false
    belongs_to :country, Totalwar.Models.Country
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:x, :y, :successful, :country_id])
    |> validate_required([:x, :y, :successful, :country_id])
  end
end
