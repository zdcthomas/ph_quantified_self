defmodule PhQuantifiedSelf.Repo.Migrations.CreateMeals do
  use Ecto.Migration

  def change do
    create table(:meals) do
      add :name, :string

      timestamps()
    end

  end
end
