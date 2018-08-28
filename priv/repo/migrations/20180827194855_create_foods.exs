defmodule PhQuantifiedSelf.Repo.Migrations.CreateFoods do
  use Ecto.Migration

  def change do
    create table(:foods) do
      add :name, :string
      add :calories, :integer

      timestamps()
    end

  end
end
