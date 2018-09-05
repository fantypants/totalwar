defmodule Totalwar.Models.Game do
  use Ecto.Schema
  import Ecto.Changeset

  schema "games" do
    field :name, :string
    has_many :countries, Totalwar.Models.Country, on_delete: :delete_all

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> cast_assoc(:countries)
    |> validate_required([:name])
  end
end
