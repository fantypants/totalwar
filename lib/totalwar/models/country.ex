defmodule Totalwar.Models.Country do
  use Ecto.Schema
  import Ecto.Changeset

  schema "countries" do
    field :name, :string
    has_many :turns, Totalwar.Models.Turn, on_delete: :delete_all
    belongs_to :game, Totalwar.Models.Game

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :game_id])
    |> cast_assoc(:turns)
    |> validate_required([:name, :game_id])
  end
end
