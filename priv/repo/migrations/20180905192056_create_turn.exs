defmodule Totalwar.Repo.Migrations.CreateTurn do
  use Ecto.Migration

  def change do
    create table(:turns) do
      add :x, :integer
      add :y, :integer
      add :successful, :boolean, default: false, null: false

      timestamps()
    end
    create table(:locations) do
      add :x, :integer
      add :y, :integer
      add :health, :boolean, default: false, null: false

      timestamps()
    end
    create table(:vessels) do
      add :name, :string
      add :location_id, references(:locations, on_delete: :nothing)

      timestamps()
    end
    create table(:fleets) do
      add :vessel_id, references(:vessels, on_delete: :nothing)

      timestamps()
    end
    create table(:countries) do
      add :name, :string
      add :fleet_id, references(:fleets, on_delete: :nothing)

      timestamps()
    end
    create table(:games) do
      add :name, :string
      add :country_id, references(:countries, on_delete: :nothing)
      timestamps()
    end
  end
end
